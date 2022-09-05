import 'dart:io';

import 'package:assement/Utils/extensions.dart';
import 'package:tuple/tuple.dart';

import '../app_logger.dart';
import '../constants.dart';
import '../enum_all.dart';

class APIConstant {
  static const int statusCodeSuccess = 200;
  static const int statusCodeCreated = 201;
  static const int statusCodeNotFound = 404;
  static const int statusCodeServiceNotAvailable = 503;
  static const int statusCodeBadGateway = 502;
  static const int statusCodeServerError = 500;

  static const int timeoutDurationNormalAPIs = 30000;

  static const int timeoutDurationMultipartAPIs = 120000;

  static String get baseDomain => AppConstant.baseURL;

  static String get prefixVersion => AppConstant.version;

  static String get prefixAuth => "auth";

  static String get prefixApi => "api";

  static String preFixRaffale = 'raffle';
  static String preFixUser = 'user-profile';
  static String preFixTicket = 'ticket_price';

  static String getValue(APIType type) {
    switch (type) {
      case APIType.login:
        return 'login';
      case APIType.signUp:
        return 'sign_up';
      case APIType.raffle:
        return 'raffle';
      case APIType.dashboard:
        return 'dashboard';
      case APIType.sold:
        return 'raffle/soldList';
      case APIType.review:
        return 'reviews';
      case APIType.raffaleUserList:
        return 'raffle/userRaffleList';
      case APIType.logout:
        return 'logout';
      case APIType.raffleDetail:
        return '${APIConstant.preFixRaffale}/view/';
      case APIType.favouriteList:
        return '${APIConstant.preFixRaffale}/favourite_list';
      case APIType.addRaffale:
        return '${APIConstant.preFixRaffale}/create';
      case APIType.currentUser:
        return '${APIConstant.preFixUser}/current}';
      case APIType.otherUser:
        return '${APIConstant.preFixUser}/other}';
      case APIType.ticketPriceList:
        return '${APIConstant.preFixTicket}/listTicketPriceDropDown';
    }
  }

  static Tuple4<String, Map<String, String>, Map<String, dynamic>,
          List<AppMultiPartFile>>
      requestParamsForSync(APIType type,
          {Map<String, dynamic>? params,
          List<AppMultiPartFile> arrFile = const [],
          String? urlParams}) {
    String apiUrl = APIConstant.baseDomain +
        APIConstant.prefixVersion +
        APIConstant.getValue(type);

    if (urlParams != null) apiUrl = apiUrl + urlParams;

    Map<String, dynamic> paramsFinal = params ?? <String, dynamic>{};

    Map<String, String> headers = <String, String>{};
    // if (userDataSingleton.accessToken.isNotEmpty) {
    //   headers['Authorization'] = userDataSingleton.accessToken;
    // }

    Logger().d("Request Url :: $apiUrl");
    Logger().d("Request Params :: $paramsFinal");
    Logger().d("Request headers :: $headers");

    return Tuple4(apiUrl, headers, paramsFinal, arrFile);
  }
}

class AppMultiPartFile {
  List<File>? localFiles;
  String? key;

  AppMultiPartFile({this.localFiles, this.key});

  AppMultiPartFile.fromType({this.localFiles, this.key});
}
