import 'package:jobsque/data/web_services/auth_web_service.dart';

import '../models/login_response.dart';
import '../models/register_response.dart';

class AuthRepository{
  final AuthWebService authWebService;
  AuthRepository(this.authWebService);
  Future register(String name,String email,String password) async{
    final registerResponse =await authWebService.registerAccount(name, email, password);
    if(registerResponse is String ){
      return registerResponse;
    }
    return RegisterResponse.fromJson(registerResponse);
  }
  Future addLocationsAndRoles(String remote, String onSite ,String roles) async{
    final response =await authWebService.updateProfile({
      "intersted_work" : roles,
      "offline_place" :onSite,
      "remote_place":remote
    });
    return response;
  }
  Future login(String email,String password) async{
    final loginResponse =await authWebService.loginAccount(email, password);
    if(loginResponse is String ){
      return loginResponse;
    }
    return LoginResponse.fromJson(loginResponse);
  }
}