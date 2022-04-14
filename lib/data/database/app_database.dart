import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class NotesTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get state => text()();

  DateTimeColumn get deadLine => dateTime()();
}

@DriftDatabase(tables: [NotesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future insertNote(NotesTableCompanion companion) async {
    return await into(notesTable).insert(companion);
  }

  Future updateNote(int id, NotesTableCompanion companion) async {
    return update(notesTable)
      ..where((note) => note.id.equals(id))
      ..write(companion);
  }

  Future deleteNote(int id) async {
    return delete(notesTable)
      ..where((note) => note.id.equals(id))
      ..go();
  }

  Future<List<NotesTableData>> getNotes() async {
    return await select(notesTable).get();
  }

  Future<List<NotesTableData>> getTypedNotes(String state) async {
    return (await (select(notesTable)
          ..where((note) => note.state.equals(state))
          ..orderBy([(t) => OrderingTerm(expression: t.deadLine)]))
        .get());
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
