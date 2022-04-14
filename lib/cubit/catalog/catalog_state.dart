abstract class CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogLoadedState extends CatalogState {}

class CatalogEmptyState extends CatalogState {}

class CatalogErrorState extends CatalogState {
  final String error;

  CatalogErrorState({required this.error});
}


