import 'package:assement/Models/DataModels/notification_list.dart';
import 'package:assement/Models/DataModels/price_list.dart';
import 'package:assement/Models/DataModels/product_detail_models.dart';
import 'package:assement/Models/DataModels/raffale_list.dart';
import 'package:assement/Models/DataModels/user_raffle.dart';
import 'package:assement/Models/DataModels/wallet.dart';
import 'package:flutter/foundation.dart';

import 'card.dart';
import 'category.dart';
import 'dashboard.dart';
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
    } else if (T == Wallet) {
      return Wallet.fromJson(json) as T;
    } else if (T == LocAddress) {
      return LocAddress.fromJson(json) as T;
    } else if (T == List<PriceList>) {
      List<PriceList> temp = [];
      if (json != null) {
        for (int i = 0; i < (json.length ?? 0); i++) {
          temp.add(PriceList.fromJson(json[i]));
        }
        return temp as T;
      } else {
        return json;
      }
    } else if (T == List<CategoryData>) {
      List<CategoryData> temp = [];
      if (json != null) {
        for (int i = 0; i < (json.length ?? 0); i++) {
          temp.add(CategoryData.fromJson(json[i]));
        }
        return temp as T;
      } else {
        return json;
      }
    } else if (T == List<Cards>) {
      List<Cards> temp = [];
      if (json != null) {
        for (int i = 0; i < (json.length ?? 0); i++) {
          temp.add(Cards.fromJson(json[i]));
        }
        return temp as T;
      } else {
        return json;
      }
    } else if (T == Cards) {
      return Cards.fromJson(json) as T;
    } else if (T == List<NotificationList>) {
      List<NotificationList> temp = [];
      if (json != null) {
        for (int i = 0; i < (json.length ?? 0); i++) {
          temp.add(NotificationList.fromJson(json[i]));
        }
        return temp as T;
      } else {
        return json;
      }
    } else {
      throw Exception('Unknown class');
    }
  }
}
