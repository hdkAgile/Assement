// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class UserAddress {
  UserAddress({
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
  double? latitude;
  double? longitude;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? shippingFullName;
  String? shippingStreet1;
  String? shippingStreet2;
  String? shippingCity;
  String? shippingState;
  String? shippingZipCode;

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
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
