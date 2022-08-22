import 'package:dio/dio.dart';
import 'api_constant.dart';
import 'app_interceptors.dart';

Dio initDio() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: APIConstant.baseDomain + APIConstant.prefixVersion,
      connectTimeout: APIConstant.timeoutDurationNormalAPIs,
      receiveTimeout: APIConstant.timeoutDurationNormalAPIs,
    ),
  );

  dio.interceptors.add(AppInterceptors());

  return dio;
}
