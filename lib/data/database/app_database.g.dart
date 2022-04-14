// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NotesTableData extends DataClass implements Insertable<NotesTableData> {
  final int id;
  final String title;
  final String description;
  final String state;
  final DateTime deadLine;
  NotesTableData(
      {required this.id,
      required this.title,
      required this.description,
      required this.state,
      required this.deadLine});
  factory NotesTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NotesTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      state: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state'])!,
      deadLine: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dead_line'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['state'] = Variable<String>(state);
    map['dead_line'] = Variable<DateTime>(deadLine);
    return map;
  }

  NotesTableCompanion toCompanion(bool nullToAbsent) {
    return NotesTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      state: Value(state),
      deadLine: Value(deadLine),
    );
  }

  factory NotesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotesTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      state: serializer.fromJson<String>(json['state']),
      deadLine: serializer.fromJson<DateTime>(json['deadLine']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'state': serializer.toJson<String>(state),
      'deadLine': serializer.toJson<DateTime>(deadLine),
    };
  }

  NotesTableData copyWith(
          {int? id,
          String? title,
          String? description,
          String? state,
          DateTime? deadLine}) =>
      NotesTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        state: state ?? this.state,
        deadLine: deadLine ?? this.deadLine,
      );
  @override
  String toString() {
    return (StringBuffer('NotesTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('state: $state, ')
          ..write('deadLine: $deadLine')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, state, deadLine);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotesTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.state == this.state &&
          other.deadLine == this.deadLine);
}

class NotesTableCompanion extends UpdateCompanion<NotesTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> state;
  final Value<DateTime> deadLine;
  const NotesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.state = const Value.absent(),
    this.deadLine = const Value.absent(),
  });
  NotesTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String state,
    required DateTime deadLine,
  })  : title = Value(title),
        description = Value(description),
        state = Value(state),
        deadLine = Value(deadLine);
  static Insertable<NotesTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? state,
    Expression<DateTime>? deadLine,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (state != null) 'state': state,
      if (deadLine != null) 'dead_line': deadLine,
    });
  }

  NotesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? state,
      Value<DateTime>? deadLine}) {
    return NotesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      state: state ?? this.state,
      deadLine: deadLine ?? this.deadLine,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (deadLine.present) {
      map['dead_line'] = Variable<DateTime>(deadLine.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('state: $state, ')
          ..write('deadLine: $deadLine')
          ..write(')'))
        .toString();
  }
}

class $NotesTableTable extends NotesTable
    with TableInfo<$NotesTableTable, NotesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String?> state = GeneratedColumn<String?>(
      'state', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _deadLineMeta = const VerificationMeta('deadLine');
  @override
  late final GeneratedColumn<DateTime?> deadLine = GeneratedColumn<DateTime?>(
      'dead_line', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, state, deadLine];
  @override
  String get aliasedName => _alias ?? 'notes_table';
  @override
  String get actualTableName => 'notes_table';
  @override
  VerificationContext validateIntegrity(Insertable<NotesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('dead_line')) {
      context.handle(_deadLineMeta,
          deadLine.isAcceptableOrUnknown(data['dead_line']!, _deadLineMeta));
    } else if (isInserting) {
      context.missing(_deadLineMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NotesTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NotesTableTable createAlias(String alias) {
    return $NotesTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $NotesTableTable notesTable = $NotesTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notesTable];
}
