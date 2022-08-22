import 'dart:convert';

import '../../Utils/Mapple.dart';

class LoginApiModel extends Mappable {
  String email;
  String password;
  String deviceToken;
  String deviceType;
  String deviceId;

  LoginApiModel({
    required this.email,
    required this.password,
    required this.deviceId,
    required this.deviceToken,
    required this.deviceType,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_id": deviceId,
        "device_token": deviceToken,
        "device_type": deviceType
      };
}

class RegisterAPIModel {
  String email;
  String password;
  String deviceToken;
  String deviceType;
  String deviceId;
  String firstName;
  String lastName;
  int signUpType;

  RegisterAPIModel(
      {required this.email,
      required this.password,
      required this.deviceType,
      required this.deviceId,
      required this.deviceToken,
      required this.firstName,
      required this.lastName,
      required this.signUpType});

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_id": deviceId,
        "device_token": deviceToken,
        "device_type": deviceType,
        "first_name": firstName,
        "last_name": lastName,
        "signup_type": signUpType
      };
}

class DashboardAPIModel {
  int userId;
  DashboardAPIModel({required this.userId});

  Map<String, dynamic> toJson() => {"user_id": userId};
}
