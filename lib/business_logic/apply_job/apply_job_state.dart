part of 'apply_job_cubit.dart';

@immutable
abstract class ApplyJobState {}

class ApplyJobInitial extends ApplyJobState {}
class ApplyJobLoadingState extends ApplyJobState {}
class BioDataSavedState extends ApplyJobState {}
class SelectedPortfolioState extends ApplyJobState {}
class CVFileSelectedState extends ApplyJobState {}
class NextStepState extends ApplyJobState {}
