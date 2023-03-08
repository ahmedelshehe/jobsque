part of 'job_details_cubit.dart';

@immutable
abstract class JobDetailsState {}

class JobDetailsInitial extends JobDetailsState {}
class JobLoadingState extends JobDetailsState {}
class JobViewIndexChangedState extends JobDetailsState {}
