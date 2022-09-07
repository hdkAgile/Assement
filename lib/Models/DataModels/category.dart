class CategoryData {
  CategoryData({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
