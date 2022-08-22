// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'Dashboard.dart';

ProductDetailModel welcomeFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String welcomeToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
  ProductDetailModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ProductDetailData? data;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        status: json["status"],
        message: json["message"],
        data: ProductDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ProductDetailData {
  ProductDetailData({
    this.id,
    this.title,
    this.quantity,
    this.soldTicket,
    this.ticketPrice,
    this.value,
    this.details,
    this.isSold,
    this.tag,
    this.condition,
    this.user,
    this.byAdmin,
    this.createdAt,
    this.status,
    this.isFavourite,
    this.isBuy,
    this.isReview,
    // this.winnerDetail,
    // this.trackingNumber,
    this.images,
  });

  int? id;
  String? title;
  int? quantity;
  int? soldTicket;
  String? ticketPrice;
  int? value;
  String? details;
  String? isSold;
  String? tag;
  String? condition;
  User? user;
  String? byAdmin;
  DateTime? createdAt;
  String? status;
  String? isFavourite;
  String? isBuy;
  String? isReview;
  // WinnerDetail? winnerDetail;
  // TrackingNumber? trackingNumber;
  List<String>? images;

  bool get favourite {
    if (isFavourite == "0") {
      return false;
    } else {
      return true;
    }
  }

  factory ProductDetailData.fromJson(Map<String, dynamic> json) =>
      ProductDetailData(
        id: json["id"],
        title: json["title"],
        quantity: json["quantity"],
        soldTicket: json["sold_ticket"],
        ticketPrice: json["ticket_price"],
        value: json["value"],
        details: json["details"],
        isSold: json["is_sold"],
        tag: json["tag"],
        condition: json["condition"],
        user: User.fromJson(json["user"]),
        byAdmin: json["by_admin"],
        createdAt: DateTime.parse(json["created_at"]),
        status: json["status"],
        isFavourite: json["is_favourite"],
        isBuy: json["is_buy"],
        isReview: json["is_review"],
        // winnerDetail: WinnerDetail.fromJson(json["winner_detail"]),
        // trackingNumber: TrackingNumber.fromJson(json["tracking_number"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "quantity": quantity,
        "sold_ticket": soldTicket,
        "ticket_price": ticketPrice,
        "value": value,
        "details": details,
        "is_sold": isSold,
        "tag": tag,
        "condition": condition,
        "user": user?.toJson(),
        "by_admin": byAdmin,
        "created_at": createdAt?.toIso8601String(),
        "status": status,
        "is_favourite": isFavourite,
        "is_buy": isBuy,
        "is_review": isReview,
        // "winner_detail": winnerDetail?.toJson(),
        // "tracking_number": trackingNumber?.toJson(),
        "images": List<String>.from(images ?? [].map((x) => x)),
      };
}

class TrackingNumber {
  TrackingNumber();

  factory TrackingNumber.fromJson(Map<String, dynamic> json) =>
      TrackingNumber();

  Map<String, dynamic> toJson() => {};
}

class WinnerDetail {
  WinnerDetail({
    this.id,
    this.name,
    this.image,
    this.address,
    this.createdDate,
    this.review,
  });

  int? id;
  String? name;
  String? image;
  Address? address;
  DateTime? createdDate;
  TrackingNumber? review;

  factory WinnerDetail.fromJson(Map<String, dynamic> json) => WinnerDetail(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        address: Address.fromJson(json["address"]),
        createdDate: DateTime.parse(json["created_date"]),
        review: TrackingNumber.fromJson(json["review"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "address": address?.toJson(),
        "created_date": createdDate?.toIso8601String(),
        "review": review?.toJson(),
      };
}

class Address {
  Address({
    this.id,
    this.userId,
    this.fullName,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.zipCode,
    this.billingFullName,
    this.billingStreet1,
    this.billingStreet2,
    this.billingCity,
    this.billingState,
    this.billingZipCode,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.shippingFullName,
    this.shippingStreet1,
    this.shippingStreet2,
    this.shippingCity,
    this.shippingState,
    this.shippingZipCode,
  });

  int? id;
  int? userId;
  String? fullName;
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? zipCode;
  String? billingFullName;
  String? billingStreet1;
  String? billingStreet2;
  String? billingCity;
  String? billingState;
  String? billingZipCode;
  String? latitude;
  String? longitude;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? shippingFullName;
  String? shippingStreet1;
  String? shippingStreet2;
  String? shippingCity;
  String? shippingState;
  String? shippingZipCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        fullName: json["full_name"],
        street1: json["street_1"],
        street2: json["street_2"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        billingFullName: json["billing_full_name"],
        billingStreet1: json["billing_street_1"],
        billingStreet2: json["billing_street_2"],
        billingCity: json["billing_city"],
        billingState: json["billing_state"],
        billingZipCode: json["billing_zip_code"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shippingFullName: json["shipping_full_name"],
        shippingStreet1: json["shipping_street_1"],
        shippingStreet2: json["shipping_street_2"],
        shippingCity: json["shipping_city"],
        shippingState: json["shipping_state"],
        shippingZipCode: json["shipping_zip_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "full_name": fullName,
        "street_1": street1,
        "street_2": street2,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "billing_full_name": billingFullName,
        "billing_street_1": billingStreet1,
        "billing_street_2": billingStreet2,
        "billing_city": billingCity,
        "billing_state": billingState,
        "billing_zip_code": billingZipCode,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shipping_full_name": shippingFullName,
        "shipping_street_1": shippingStreet1,
        "shipping_street_2": shippingStreet2,
        "shipping_city": shippingCity,
        "shipping_state": shippingState,
        "shipping_zip_code": shippingZipCode,
      };
}
