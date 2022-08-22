import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/constants.dart';

var sharedUser = AppUser.singleton;

class AppUser {
  AppUser._internal();

  static final AppUser singleton = AppUser._internal();

  factory AppUser() {
    return singleton;
  }

  SingleUser user = SingleUser();
  String token = '';
  String tokenType = '';
  int expiresIn = 0;

  Future<void> updateValue(Map<String, dynamic> json) async {
    if (json.isNotEmpty) {
      user = SingleUser.fromJson(json['user']);
      token = json['token'] ?? '';
      tokenType = json['tokenType'] ?? '';
      expiresIn = json['expiresIn'] ?? 0;
    }
    _saveUser();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dict = <String, dynamic>{};
    dict['user'] = user;
    dict['token'] = token;
    dict['tokenType'] = tokenType;
    dict['expiresIn'] = expiresIn;
    return dict;
  }

  Future<void> _saveUser() async {
    final userMap = toJson();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(PreferenceKeys.saveUser, jsonEncode(userMap));
  }

  static Future<void> saveIsLoginVerfied() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PreferenceKeys.isLoggedIn, true);
  }

  static Future<bool> isLoginVerified() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(PreferenceKeys.isLoggedIn) ?? false;
  }

  static Future<void> clearPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  Future<void> loadUserDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String jsonStoredUserDetails =
        preferences.getString(PreferenceKeys.saveUser) ?? "";
    if (jsonStoredUserDetails.isNotEmpty) {
      Map<String, dynamic> jsonValue = json.decode(jsonStoredUserDetails);
      await updateValue(jsonValue);
    }
  }
}

class SingleUser {
  SingleUser({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.image = '',
    this.signupType = '',
    this.appleId = '',
    this.facebookId = '',
    this.isActive = 0,
    this.accountId = '',
    this.customerId = '',
    this.createdAt = '',
    this.isVerify = '',
    this.isVender = '',
  });

  int id = 0;
  String firstName = '';
  String lastName = '';
  String email = '';
  String image = '';
  String signupType = '';
  String appleId = '';
  String facebookId = '';
  int isActive = 0;
  String accountId = '';
  String customerId = '';
  String createdAt = '';
  String isVerify = '';
  String isVender = '';

  factory SingleUser.fromJson(Map<String, dynamic> json) => SingleUser(
        id: json["id"] ?? 0,
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        email: json["email"] ?? '',
        image: json["image"] ?? '',
        signupType: json["signup_type"] ?? '',
        appleId: json["apple_id"] ?? '',
        facebookId: json["facebook_id"] ?? '',
        isActive: json["is_active"] ?? 0,
        accountId: json["account_id"] ?? '',
        customerId: json["customer_id"] ?? '',
        createdAt: json["created_at"] ?? '',
        isVerify: json["is_verify"] ?? '',
        isVender: json["is_vender"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "image": image,
        "signup_type": signupType,
        "apple_id": appleId,
        "facebook_id": facebookId,
        "is_active": isActive,
        "account_id": accountId,
        "customer_id": customerId,
        "created_at": createdAt,
        "is_verify": isVerify,
        "is_vender": isVender,
      };
}
