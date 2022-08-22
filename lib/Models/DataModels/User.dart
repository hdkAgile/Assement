// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class UserData {
  UserData({
    this.user,
    this.token,
    this.tokenType,
    this.expiresIn,
  });

  User? user;
  String? token;
  String? tokenType;
  int? expiresIn;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        user: User.fromJson(json["user"]),
        token: json["token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.image,
    this.signupType,
    this.appleId,
    this.facebookId,
    this.isActive,
    this.accountId,
    this.customerId,
    this.createdAt,
    this.isVerify,
    this.isVender,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  String? signupType;
  String? appleId;
  String? facebookId;
  int? isActive;
  String? accountId;
  String? customerId;
  String? createdAt;
  String? isVerify;
  String? isVender;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        image: json["image"],
        signupType: json["signup_type"],
        appleId: json["apple_id"],
        facebookId: json["facebook_id"],
        isActive: json["is_active"],
        accountId: json["account_id"],
        customerId: json["customer_id"],
        createdAt: json["created_at"],
        isVerify: json["is_verify"],
        isVender: json["is_vender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "image": image,
        "signup_type": signupType,
        "apple_id": appleId,
        "facebook_id": facebookId,
        "is_active": isActive,
        "account_id": accountId,
        "customer_id": customerId,
        "created_at": createdAt,
        "is_verify": isVerify,
        "is_vender": isVender,
      };
}
