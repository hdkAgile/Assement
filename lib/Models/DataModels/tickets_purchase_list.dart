import 'User.dart';

class TicketPurchaseList {
  TicketPurchaseList({
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.isFavourite,
    this.isSold,
    this.byAdmin,
    this.user,
    this.createdAt,
    this.image,
  });

  int? id;
  String? title;
  int? quantity;
  int? price;
  String? isFavourite;
  String? isSold;
  String? byAdmin;
  User? user;
  DateTime? createdAt;
  List<String>? image;

  factory TicketPurchaseList.fromJson(Map<String, dynamic> json) =>
      TicketPurchaseList(
        id: json["id"],
        title: json["title"],
        quantity: json["quantity"],
        price: json["price"],
        isFavourite: json["is_favourite"],
        isSold: json["is_sold"],
        byAdmin: json["by_admin"],
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
        image: List<String>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "quantity": quantity,
        "price": price,
        "is_favourite": isFavourite,
        "is_sold": isSold,
        "by_admin": byAdmin,
        "user": user?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "image": List<dynamic>.from(image ?? [].map((x) => x)),
      };
}
