// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

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
  List<EndingSoon>? endingSoon;
  List<Winner>? winners;
  List<EndingSoon>? latestRaffles;
  List<Banners>? categories;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        banners:
            List<Banners>.from(json["banners"].map((x) => Banners.fromJson(x))),
        endingSoon: List<EndingSoon>.from(
            json["ending_soon"].map((x) => EndingSoon.fromJson(x))),
        winners:
            List<Winner>.from(json["winners"].map((x) => Winner.fromJson(x))),
        latestRaffles: List<EndingSoon>.from(
            json["latest_raffles"].map((x) => EndingSoon.fromJson(x))),
        categories: List<Banners>.from(
            json["categories"].map((x) => Banners.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<Banners>.from(banners ?? [].map((x) => x.toJson())),
        "ending_soon":
            List<EndingSoon>.from(endingSoon ?? [].map((x) => x.toJson())),
        "winners": List<Winner>.from(winners ?? [].map((x) => x.toJson())),
        "latest_raffles":
            List<EndingSoon>.from(latestRaffles ?? [].map((x) => x.toJson())),
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

class EndingSoon {
  EndingSoon({
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.soldTicket,
    this.isSold,
    this.status,
    this.byAdmin,
    this.isFavourite,
    this.user,
    this.createdAt,
    this.images,
  });

  int? id;
  String? title;
  int? quantity;
  int? price;
  int? soldTicket;
  String? isSold;
  String? status;
  String? byAdmin;
  String? isFavourite;
  User? user;
  DateTime? createdAt;
  List<String>? images;

  factory EndingSoon.fromJson(Map<String, dynamic> json) => EndingSoon(
        id: json["id"],
        title: json["title"],
        quantity: json["quantity"],
        price: json["price"],
        soldTicket: json["sold_ticket"],
        isSold: json["is_sold"],
        status: json["status"],
        byAdmin: json["by_admin"],
        isFavourite: json["is_favourite"],
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "quantity": quantity,
        "price": price,
        "sold_ticket": soldTicket,
        "is_sold": isSold,
        "status": status,
        "by_admin": byAdmin,
        "is_favourite": isFavourite,
        "user": user?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.image,
    this.isVerify,
    this.isVender,
  });

  int? id;
  String? name;
  String? image;
  String? isVerify;
  String? isVender;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        image: json["image"] ?? null,
        isVerify: json["is_verify"] ?? null,
        isVender: json["is_vender"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "image": image ?? null,
        "is_verify": isVerify ?? null,
        "is_vender": isVender ?? null,
      };
}

class Winner {
  Winner({
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.soldTicket,
    this.status,
    this.isFavourite,
    this.byAdmin,
    this.user,
    this.isWinner,
    this.createdAt,
    this.images,
  });

  int? id;
  String? title;
  int? quantity;
  int? price;
  int? soldTicket;
  String? status;
  String? isFavourite;
  String? byAdmin;
  User? user;
  Banners? isWinner;
  DateTime? createdAt;
  List<String>? images;

  factory Winner.fromJson(Map<String, dynamic> json) => Winner(
        id: json["id"],
        title: json["title"],
        quantity: json["quantity"],
        price: json["price"],
        soldTicket: json["sold_ticket"],
        status: json["status"],
        isFavourite: json["is_favourite"],
        byAdmin: json["by_admin"],
        user: User.fromJson(json["user"]),
        isWinner: Banners.fromJson(json["is_winner"]),
        createdAt: DateTime.parse(json["created_at"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "quantity": quantity,
        "price": price,
        "sold_ticket": soldTicket,
        "status": status,
        "is_favourite": isFavourite,
        "by_admin": byAdmin,
        "user": user?.toJson(),
        "is_winner": isWinner?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "images": List<dynamic>.from(images ?? [].map((x) => x)),
      };
}
