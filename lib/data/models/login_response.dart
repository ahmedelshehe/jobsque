class LoginResponse {
  LoginResponse({
      User? user, 
      String? token, 
      bool? status,}){
    _user = user;
    _token = token;
    _status = status;
}

  LoginResponse.fromJson(dynamic json) {
    _user = json['\$user'] != null ? User.fromJson(json['\$user']) : null;
    _token = json['token'];
    _status = json['status'];
  }
  User? _user;
  String? _token;
  bool? _status;

  User? get user => _user;
  String get token => _token ?? '';
  bool get status => _status ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    map['status'] = _status;
    return map;
  }

}

class User {
  User({
      num? id, 
      String? name, 
      String? otp, 
      bool? towStep, 
      String? email, 
      bool? emailVerifiedAt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _otp = otp;
    _towStep = towStep;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _otp = json['otp'];
    _towStep = json['tow_step'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _otp;
  bool? _towStep;
  String? _email;
  bool? _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;

  num get id => _id ?? 0;
  String get name => _name ?? '';
  String get otp => _otp ?? '';
  bool get towStep => _towStep ?? false;
  String get email => _email ?? '';
  bool get emailVerifiedAt => _emailVerifiedAt ?? false;
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['otp'] = _otp;
    map['tow_step'] = _towStep;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}