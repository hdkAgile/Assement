import 'dart:convert';

class LogoutAPIModel {
  String deviceId;

  LogoutAPIModel({required this.deviceId});

  Map<String, dynamic> toJson() => {"device_id": deviceId};
}
