import 'package:flutter/foundation.dart';

enum SignUpType { signUp, signIn }

extension SignUpTypeExtention on SignUpType {
  int get value {
    switch (this) {
      case SignUpType.signUp:
        return 0;
      case SignUpType.signIn:
        return 1;
    }
  }
}

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
