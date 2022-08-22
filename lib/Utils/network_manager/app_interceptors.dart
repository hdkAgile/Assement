import 'dart:async';

// import 'package:agile_structure/singleton/user_data_singleton.dart';
import 'package:dio/dio.dart';

import '../../Models/DataModels/app_user.dart';

class AppInterceptors extends Interceptor {
  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (sharedUser.token.isNotEmpty) {
      options.headers.addAll(
        {"Authorization": 'Bearer ${sharedUser.token}'},
      );
      handler.next(options);
      return options;
    } else {
      handler.next(options);
    }
  }

  @override
  FutureOr<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
    return response;

    /// TODO -: handle response according to requirements
  }

  @override
  FutureOr<dynamic> onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
    return err;

    /// TODO -: handle errors according to requirements
  }
}
