class PriceList {
  PriceList({
    this.id,
    this.amount,
  });

  int? id;
  String? amount;

  String get title {
    return '\$${amount}';
  }

  factory PriceList.fromJson(Map<String, dynamic> json) => PriceList(
        id: json["id"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
      };
}
