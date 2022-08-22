import 'dart:convert';

class HeaderAPIModel {
  String token;
  HeaderAPIModel({required this.token});

  Map<String, String> toJson() => {"Authorization": 'Bearer $token'};
}
