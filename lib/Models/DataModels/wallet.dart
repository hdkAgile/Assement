class Wallet {
  Wallet({this.amount});

  int? amount;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}
