part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class AppLoadingState extends SearchState {}
class AppCreateDatabaseState extends SearchState {}
class AppGetDatabaseState extends SearchState {}
class AppInsertSearchState extends SearchState {}
class SearchJobState extends SearchState {}
class AppDeleteSearchState extends SearchState {}
class SearchLocationTypeEditedState extends SearchState {}
class SearchJobTypeEditedState extends SearchState {}
class SearchPostDateEditedState extends SearchState {}
class SearchJobLevelsEditedState extends SearchState {}
class SearchFiltersResetState extends SearchState {}
