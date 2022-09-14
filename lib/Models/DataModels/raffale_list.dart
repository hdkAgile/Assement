import 'dart:convert';

import 'package:assement/Utils/enum_all.dart';

import 'User.dart';

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class RaffaleList {
  RaffaleList({
    this.total,
    this.perPage,
    this.data,
  });

  int? total;
  int? perPage;
  List<Raffale>? data;

  factory RaffaleList.fromJson(Map<String, dynamic> json) => RaffaleList(
        total: json["total"],
        perPage: json["perPage"],
        data: List<Raffale>.from(json["data"].map((x) => Raffale.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "perPage": perPage,
        "data": List<dynamic>.from(data ?? [].map((x) => x.toJson())),
      };
}

class Raffale {
  Raffale({
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

  RaffleFavourite get favourite {
    if (isFavourite == '0') {
      return RaffleFavourite.unFavourite;
    } else {
      return RaffleFavourite.favourite;
    }
  }

  factory Raffale.fromJson(Map<String, dynamic> json) => Raffale(
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
        "images": List<dynamic>.from(images ?? [].map((x) => x)),
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
        id: json["id"],
        name: json["name"],
        image: json["image"],
        isVerify: json["is_verify"],
        isVender: json["is_vender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "is_verify": isVerify,
        "is_vender": isVender,
      };
}
