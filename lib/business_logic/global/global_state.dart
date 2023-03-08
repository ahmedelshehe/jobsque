part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}
class AppLoadingState extends GlobalState {}
class JobNotificationAdded extends GlobalState {}
class ScreenChangedState extends GlobalState {}
class MainNotificationsSortedState extends GlobalState {}
