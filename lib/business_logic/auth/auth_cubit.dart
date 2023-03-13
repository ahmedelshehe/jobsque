// ignore_for_file: unnecessary_import, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/constants/my_cache_keys.dart';
import 'package:jobsque/data/local/my_cache.dart';
import 'package:jobsque/data/models/login_response.dart';
import 'package:jobsque/data/repositories/auth_repository.dart';
import 'package:jobsque/data/web_services/auth_web_service.dart';
import 'package:meta/meta.dart';

import '../../constants/response_codes.dart';
import '../../data/models/register_response.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  AuthRepository authRepository=AuthRepository(AuthWebService());
  List<String> roles=[];
  List<String> remoteLocations=[];
  List<String> onSiteLocations=[];
  Future<String> register(String name,String email,String password) async{
      emit(RegisterLoadingState());
      final registerResponse= await authRepository.register(name, email, password);
      if(registerResponse is RegisterResponse){
        MyCache.putString(key: MyCacheKeys.myID, value: registerResponse.profile!.userId.toString());
        MyCache.putString(key: MyCacheKeys.myEmail, value: registerResponse.profile!.email);
        MyCache.putString(key: MyCacheKeys.myToken, value: registerResponse.token);
        MyCache.putString(key: MyCacheKeys.fullName, value: registerResponse.profile!.name);
        emit(RegisterSuccessfulState());
        return successfulCode;
      }else if(registerResponse ==failureCode){
        emit(RegisterFailureState());
        return failureCode;
      }else if(registerResponse ==errorCode){
        emit(RegisterErrorState());
        return errorCode;
      }else {
        return errorCode;
      }
  }
  Future<String> login(String email,String password) async{
    emit(LoginLoadingState());
    final loginResponse= await authRepository.login(email, password);
    if(loginResponse is LoginResponse){
      MyCache.putString(key: MyCacheKeys.myID, value: loginResponse.user!.id.toString());
      MyCache.putString(key: MyCacheKeys.myEmail, value: loginResponse.user!.email);
      MyCache.putString(key: MyCacheKeys.myToken, value: loginResponse.token);
      MyCache.putString(key: MyCacheKeys.fullName, value: loginResponse.user!.name);
      emit(LoginSuccessfulState());
      return successfulCode;
    }else if(loginResponse ==failureCode){
      emit(LoginFailureState());
      return failureCode;
    }else if(loginResponse ==errorCode){
      emit(LoginErrorState());
      return errorCode;
    }else {
      return errorCode;
    }
  }
  void chooseRoles(List<String> addedRoles){
    emit(RegisterLoadingState());
    roles=addedRoles;
    emit(RolesAddedState());
  }
  void chooseLocation({required List<String> remote, required List<String> onSite}){
    emit(RegisterLoadingState());
    remoteLocations=remote;
    onSiteLocations=onSite;
    emit(LocationsAddedState());
  }
  Future<String> addLocationsAndRoles() async{
    emit(RegisterLoadingState());
    final response= await authRepository.addLocationsAndRoles(remoteLocations.join(" ,"), onSiteLocations.join(" ,"), roles.join(" ,"));
    if(response == successfulCode){
      emit(RolesAndLocationsAddedState());
      return successfulCode;
    }else if(response == failureCode){
      emit(RegisterFailureState());
      return failureCode;
    }else{
      emit(RegisterErrorState());
      return errorCode;
    }
  }
}
