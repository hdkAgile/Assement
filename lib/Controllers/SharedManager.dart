import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:get/get.dart';
import '../Models/DataModels/User.dart';
import '../Utils/constants.dart';

class SharedManager {
  static SharedManager shared = SharedManager();
  UserData? _userData;

  Future<bool> saveUser(UserData? user) async {
    if (user != null) {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final isSaved =
          await preferences.setString(AppText.saveUser, jsonEncode(user));
      return isSaved;
    } else {
      return false;
    }
  }

  Future getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userString = preferences.getString(AppText.saveUser);
    if (userString != null) {
      Map<String, dynamic> userMap =
          jsonDecode(userString) as Map<String, dynamic>;
      UserData user = UserData.fromJson(userMap);
      _userData = user;
      print('UserData: ${user.token}');
    }
    return userString;
  }

  String getToken() {
    if (_userData?.token != null) {
      return _userData?.token ?? '';
    } else {
      return '';
    }
  }

  UserData? fetchUser() {
    return _userData;
  }

  void clearData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final isRemoved = await preferences.remove(AppText.saveUser);
    if (isRemoved) {
      _userData = null;
    }
  }
}
