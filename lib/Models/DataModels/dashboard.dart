// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:assement/Models/DataModels/raffale_list.dart';
import 'package:flutter/material.dart';

DashboardResponse welcomeFromJson(String str) =>
    DashboardResponse.fromJson(json.decode(str));

String welcomeToJson(DashboardResponse data) => json.encode(data.toJson());

class DashboardResponse {
  DashboardResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Dashboard? data;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
        status: json["status"],
        message: json["message"],
        data: Dashboard.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Dashboard {
  Dashboard({
    this.banners,
    this.endingSoon,
    this.winners,
    this.latestRaffles,
    this.categories,
  });

  List<Banners>? banners;
  List<Raffale>? endingSoon;
  List<Raffale>? winners;
  List<Raffale>? latestRaffles;
  List<Banners>? categories;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        banners:
            List<Banners>.from(json["banners"].map((x) => Banners.fromJson(x))),
        endingSoon: List<Raffale>.from(
            json["ending_soon"].map((x) => Raffale.fromJson(x))),
        winners:
            List<Raffale>.from(json["winners"].map((x) => Raffale.fromJson(x))),
        latestRaffles: List<Raffale>.from(
            json["latest_raffles"].map((x) => Raffale.fromJson(x))),
        categories: List<Banners>.from(
            json["categories"].map((x) => Banners.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<Banners>.from(banners ?? [].map((x) => x.toJson())),
        "ending_soon":
            List<Raffale>.from(endingSoon ?? [].map((x) => x.toJson())),
        "winners": List<Raffale>.from(winners ?? [].map((x) => x.toJson())),
        "latest_raffles":
            List<Raffale>.from(latestRaffles ?? [].map((x) => x.toJson())),
        "categories":
            List<Banners>.from(categories ?? [].map((x) => x.toJson())),
      };
}

class Banners {
  Banners({
    this.id,
    this.name,
    this.image,
    this.raffleId,
    this.state,
  });

  int? id;
  String? name;
  String? image;
  int? raffleId;
  String? state;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        raffleId: json["raffle_id"] ?? null,
        state: json["state"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "raffle_id": raffleId ?? null,
        "state": state ?? null,
      };
}
