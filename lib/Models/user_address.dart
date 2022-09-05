import 'dart:convert';

class UserAddress {
  UserAddress({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.zipCode,
    this.latitude,
    this.longitude,
  });

  String? street1;
  String? street2;
  String? city;
  String? state;
  int? zipCode;
  double? latitude;
  double? longitude;

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        street1: json["street_1"],
        street2: json["street_2"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "street_1": street1,
        "street_2": street2,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "latitude": latitude,
        "longitude": longitude,
      };
}
