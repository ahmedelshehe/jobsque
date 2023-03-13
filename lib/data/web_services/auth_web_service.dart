import 'package:dio/dio.dart';
import 'package:jobsque/constants/my_cache_keys.dart';
import 'package:jobsque/constants/response_codes.dart';
import 'package:jobsque/constants/urls.dart';
import 'package:jobsque/data/local/my_cache.dart';
class AuthWebService {
  late Dio dio;
  AuthWebService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(baseOptions);
  }
  Future registerAccount(String name, String email, String password) async {
    try {
      Response response = await dio.post(registerEndPoint, queryParameters: {
        'name': name,
        'email': email,
        'password': password
      },
        options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
            },
            followRedirects: true
        )
      );
      return response.data;
    } catch (e) {
      if(e.toString() =='DioError [bad response]: The request returned an invalid status code of 500.'){
        return failureCode;
      }else{
        return errorCode;
      }
    }
  }
  Future loginAccount(String email, String password) async {
    try {
      Response response = await dio.post(loginEndPoint, queryParameters: {
        'email': email,
        'password': password
      });
      print(response);
      if(response.data['status']){
        return response.data;
      }else{
        return failureCode;
      }
    } catch (e){
    print(e);
        return errorCode;
    }
  }

  Future<String> updateProfile(Map<String, dynamic> parameters) async {
    try {
      await dio.put(
          '$updateProfileEndPoint${MyCache.getString(key: MyCacheKeys.myID)}',
          queryParameters: parameters,
          options: Options(headers: {
            "Authorization":
                "Bearer ${MyCache.getString(key: MyCacheKeys.myToken)}",
            "Content-Type" :
                "application/x-www-form-urlencoded"
          }));
      return successfulCode;
    } catch (e) {
      if(e.toString() =='DioError [bad response]: The request returned an invalid status code of 500.'){
        return failureCode;
      }else{
        return errorCode;
      }
    }
  }
}
