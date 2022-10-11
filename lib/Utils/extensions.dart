import 'dart:ui';

import 'package:assement/Utils/constants.dart';
import 'package:assement/Utils/network_manager/api_constant.dart';
import 'package:assement/Views/Custom/image_view.dart';

import 'enum_all.dart';

extension SignUpTypeExtention on SignUpType {
  int get value {
    switch (this) {
      case SignUpType.signUp:
        return 0;
      case SignUpType.signIn:
        return 1;
    }
  }

  APIType get path {
    switch (this) {
      case SignUpType.signUp:
        return APIType.signUp;
      case SignUpType.signIn:
        return APIType.login;
    }
  }
}

extension EditFieldExtendion on EditFieds {
  String get title {
    switch (this) {
      case EditFieds.name:
        return 'Name';
      case EditFieds.email:
        return 'Email';
      case EditFieds.changePassword:
        return 'Reset Password';
    }
  }
}

extension URLHostExtension on URLHost {
  String get baseURL {
    switch (this) {
      case URLHost.local:
        return APIConstant.localBaseURL;
      case URLHost.live:
        return '';
      default:
        return '';
    }
  }

  String get firebaseKey {
    switch (this) {
      case URLHost.local:
        return '';
      case URLHost.live:
        return '';
      case URLHost.staging:
        return '';
    }
  }
}

extension Condition on ConditionType {
  String get title {
    switch (this) {
      case ConditionType.newInPackage:
        return 'New in Package';
      case ConditionType.lightlyUsed:
        return 'Lightly Used';
      case ConditionType.used:
        return 'Used';
    }
  }

  int get value {
    switch (this) {
      case ConditionType.newInPackage:
        return 1;
      case ConditionType.lightlyUsed:
        return 2;
      case ConditionType.used:
        return 3;
    }
  }
}

extension UserTypeExtension on UserType {
  APIType get apiType {
    switch (this) {
      case UserType.current:
        return APIType.currentUser;
      case UserType.other:
        return APIType.otherUser;
    }
  }
}

extension FavouriteUnFavouriteExtension on RaffleFavourite {
  int get value {
    switch (this) {
      case RaffleFavourite.favourite:
        return 1;
      case RaffleFavourite.unFavourite:
        return 0;
    }
  }

  String get imagePath {
    switch (this) {
      case RaffleFavourite.favourite:
        return AppImages.heart_Fill;
      case RaffleFavourite.unFavourite:
        return AppImages.heart;
    }
  }

  bool get isFavourite {
    switch (this) {
      case RaffleFavourite.favourite:
        return true;
      case RaffleFavourite.unFavourite:
        return false;
    }
  }
}
