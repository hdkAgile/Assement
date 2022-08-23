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
}

extension URLHostExtension on URLHost {
  String get baseURL {
    switch (this) {
      case URLHost.local:
        return 'http://202.131.117.92:7066';
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
