import 'dart:convert';

import '../../Utils/Mapple.dart';

class UserAPIModel extends Mappable {
  int limit;
  int offset;
  int forUser;
  int status;
  String createdAt;
  int userId;

  UserAPIModel(
      {required this.limit,
      required this.offset,
      required this.status,
      required this.forUser,
      required this.userId,
      required this.createdAt});

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "status": status,
        "created_at": createdAt,
        "for_user": forUser,
        "user_id": userId
      };
}
