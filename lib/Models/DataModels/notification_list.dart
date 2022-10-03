class NotificationList {
  NotificationList({
    this.id,
    this.typeId,
    this.type,
    this.isActive,
  });

  int? id;
  int? typeId;
  String? type;
  int? isActive;

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      NotificationList(
        id: json["id"],
        typeId: json["type_id"],
        type: json["type"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_id": typeId,
        "type": type,
        "is_active": isActive,
      };
}
