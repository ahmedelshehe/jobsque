part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class RegisterLoadingState extends AuthState {}
class LoginLoadingState extends AuthState {}
class RegisterErrorState extends AuthState {}
class LoginErrorState extends AuthState {}
class RegisterSuccessfulState extends AuthState {}
class LoginSuccessfulState extends AuthState {}
class RegisterFailureState extends AuthState {}
class LoginFailureState extends AuthState {}
class RolesAddedState extends AuthState {}
class LocationsAddedState extends AuthState {}
class RolesAndLocationsAddedState extends AuthState {}
