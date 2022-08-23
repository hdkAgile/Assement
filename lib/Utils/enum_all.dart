import 'package:flutter/foundation.dart';

enum SignUpType { signUp, signIn }

enum SourceType { camera, photoLibrary }

enum APIType {
  login,
  signUp,
  raffle,
  dashboard,
  review,
  raffaleUserList,
  raffleDetail,
  logout,
  sold,
  favouriteList,
  addRaffale
}

enum URLHost { local, live, staging }

enum ConditionType { newInPackage, lightlyUsed, used }
