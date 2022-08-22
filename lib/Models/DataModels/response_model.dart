import 'package:assement/Models/DataModels/product_detail_models.dart';
import 'package:assement/Models/DataModels/raffale_list.dart';
import 'package:assement/Models/DataModels/user_raffle.dart';

import 'Dashboard.dart';
import 'User.dart';

class ResponseModel<T> {
  ResponseModel({required this.status, required this.message, this.data});

  late int status;
  late String message;
  T? data;

  ResponseModel.fromJson(Map<String, dynamic> json, int? statusCode) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] == null || json["data"].length == 0)
        ? null
        : _handleClasses(
            json['data'],
          );
  }

  T _handleClasses(json) {
    if (T == UserData) {
      return UserData.fromJson(json) as T;
    } else if (T == UserRaffleData) {
      return UserRaffleData.fromJson(json) as T;
    } else if (T == Dashboard) {
      return Dashboard.fromJson(json) as T;
    } else if (T == RaffaleList) {
      return RaffaleList.fromJson(json) as T;
    } else if (T == ProductDetailData) {
      return ProductDetailData.fromJson(json) as T;
    } else {
      throw Exception('Unknown class');
    }
  }
}
