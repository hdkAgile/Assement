import 'package:assement/Bindings/favorite_binding.dart';
import 'package:assement/Bindings/home_binding.dart';
import 'package:assement/Bindings/login_binding.dart';
import 'package:assement/Bindings/search_binding.dart';
import 'package:assement/Bindings/signUp_binding.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Views/create_account.dart';
import 'package:assement/Views/home.dart';
import 'package:assement/Views/home_tab.dart';
import 'package:assement/Views/splash.dart';
import 'package:assement/Views/welcome.dart';
import 'package:get/get.dart';

import '../Views/Custom/search_tab.dart';
import 'enum_all.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: ScreenRoutesConstant.splashScreen, page: () => Splash()),
    GetPage(name: ScreenRoutesConstant.searchScreen, page: () => Search()),
    GetPage(
        name: ScreenRoutesConstant.createAccount,
        page: () => CreateAccount(type: SignUpType.signUp),
        bindings: [SignUpBinding(), LoginBinding()]),
    GetPage(
        name: ScreenRoutesConstant.homeTab,
        page: () => HomeTab(),
        bindings: [HomeBinding(), SearchBinding(), FavoriteBinding()]),
    GetPage(
        name: ScreenRoutesConstant.welcomeScreen, page: () => WelComeView()),
  ];
}
