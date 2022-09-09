class Cards {
  Cards({
    this.id,
    this.country,
    this.expMonth,
    this.expYear,
    this.last4,
    this.name,
  });

  String? id;
  String? country;
  int? expMonth;
  int? expYear;
  String? last4;
  String? name;

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        id: json["id"],
        country: json["country"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        last4: json["last4"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "exp_month": expMonth,
        "exp_year": expYear,
        "last4": last4,
        "name": name,
      };
}
