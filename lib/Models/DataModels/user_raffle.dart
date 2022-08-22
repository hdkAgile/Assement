// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:assement/Models/DataModels/raffale_list.dart';

class UserRaffleData {
  UserRaffleData({
    this.total,
    this.perPage,
    this.data,
  });

  int? total;
  int? perPage;
  List<Raffale>? data;

  factory UserRaffleData.fromJson(Map<String, dynamic> json) => UserRaffleData(
        total: json["total"],
        perPage: json["perPage"],
        data: List<Raffale>.from(json["data"].map((x) => Raffale.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "perPage": perPage,
        "data": List<Raffale>.from(data ?? [].map((x) => x.toJson())),
      };
}
