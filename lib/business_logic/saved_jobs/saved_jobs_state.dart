part of 'saved_jobs_cubit.dart';

@immutable
abstract class SavedJobsState {}

class SavedJobsInitial extends SavedJobsState {}
class SavedJobsLoadingState extends SavedJobsState {}
class GetSavedJobsState extends SavedJobsState {}
