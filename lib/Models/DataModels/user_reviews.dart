// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserReview welcomeFromJson(String str) => UserReview.fromJson(json.decode(str));

String welcomeToJson(UserReview data) => json.encode(data.toJson());

class UserReview {
  UserReview({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  UserReviewData? data;

  factory UserReview.fromJson(Map<String, dynamic> json) => UserReview(
        status: json["status"],
        message: json["message"],
        data: UserReviewData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class UserReviewData {
  UserReviewData({
    this.total,
    this.perPage,
    this.data,
  });

  int? total;
  int? perPage;
  List<ReviewList>? data;

  factory UserReviewData.fromJson(Map<String, dynamic> json) => UserReviewData(
        total: json["total"],
        perPage: json["perPage"],
        data: List<ReviewList>.from(
            json["data"].map((x) => ReviewList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "perPage": perPage,
        "data": List<ReviewList>.from(data!.map((x) => x.toJson())),
      };
}

class ReviewList {
  ReviewList({
    this.reviewId,
    this.description,
    this.rating,
    this.userId,
    this.firstName,
    this.lastName,
    this.raffleName,
    this.image,
    this.raffleId,
  });

  int? reviewId;
  String? description;
  int? rating;
  int? userId;
  String? firstName;
  String? lastName;
  String? raffleName;
  List<String>? image;
  int? raffleId;

  factory ReviewList.fromJson(Map<String, dynamic> json) => ReviewList(
        reviewId: json["review_id"],
        description: json["description"],
        rating: json["rating"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        raffleName: json["raffle_name"],
        image: List<String>.from(json["image"].map((x) => x)),
        raffleId: json["raffle_id"],
      );

  Map<String, dynamic> toJson() => {
        "review_id": reviewId,
        "description": description,
        "rating": rating,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "raffle_name": raffleName,
        "image": List<String>.from(image!.map((x) => x)),
        "raffle_id": raffleId,
      };
}
