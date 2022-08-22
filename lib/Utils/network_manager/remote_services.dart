import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../../Models/DataModels/response_model.dart';
import '../app_logger.dart';
import '../constants.dart';
import '../enum_all.dart';
import 'api_constant.dart';
import 'init_dio.dart';
import 'network_util.dart';

var sharedServiceManager = RemoteServices.singleton;

class RemoteServices {
  static var dio = initDio();

  RemoteServices._internal();

  static final RemoteServices singleton = RemoteServices._internal();

  factory RemoteServices() {
    return singleton;
  }

  /// GET requests
  Future<ResponseModel<T>> createGetRequest<T>(
      {required APIType typeOfEndPoint,
      Map<String, dynamic>? params,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = APIConstant.requestParamsForSync(typeOfEndPoint,
          params: params, urlParams: urlParam);

      try {
        Response response = await dio.get(requestFinal.item1,
            options: Options(headers: requestFinal.item2));

        // final Map<String, dynamic> responseJson =
        //     json.decode(response.data.toString());

        return ResponseModel<T>.fromJson(response.data, response.statusCode!);
      } on DioError catch (e) {
        return createErrorResponse(
            status: APIConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponse(
          status: APIConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }

  /// POST requests
  Future<ResponseModel<T>> createPostRequest<T>(
      {required APIType typeOfEndPoint,
      Map<String, dynamic>? params,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = APIConstant.requestParamsForSync(typeOfEndPoint,
          params: params, urlParams: urlParam);
      /*
      * item1 => API End-Point
      * item2 => Header
      * item3 => Request Param
      * item4 => Multipart file
      * */

      try {
        Response response = await dio.post(requestFinal.item1,
            data: requestFinal.item3,
            options: Options(headers: requestFinal.item2));

        return ResponseModel<T>.fromJson(response.data, response.statusCode);
      } on DioError catch (e) {
        if ((e.response?.data is Map) && (e.response?.data as Map).isNotEmpty) {
          Map<String, dynamic> data = e.response?.data;
          return ResponseModel.fromJson(data, e.response?.statusCode);
        }

        return createErrorResponse(
            status: APIConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponse(
          status: APIConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }

  /// PUT requests
  Future<ResponseModel<T>> createPutRequest<T>(
      {required APIType typeOfEndPoint,
      Map<String, dynamic>? params,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = APIConstant.requestParamsForSync(typeOfEndPoint,
          params: params, urlParams: urlParam);
      /*
      * item1 => API End-Point
      * item2 => Header
      * item3 => Request Param
      * item4 => Multipart file
      * */
      try {
        Response response = await dio.put(requestFinal.item1,
            data: requestFinal.item3,
            options: Options(headers: requestFinal.item2));

        return ResponseModel<T>.fromJson(
            json.decode(response.data.toString()), response.statusCode);
      } on DioError catch (e) {
        return createErrorResponse(
            status: APIConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponse(
          status: APIConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }

  /// DELETE requests
  Future<ResponseModel<T>> createDeleteRequest<T>(
      {required APIType typeOfEndPoint,
      Map<String, dynamic>? params,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = APIConstant.requestParamsForSync(typeOfEndPoint,
          params: params, urlParams: urlParam);
      /*
      * item1 => API End-Point
      * item2 => Header
      * item3 => Request Param
      * item4 => Multipart file
      * */
      try {
        Response response = await dio.delete(requestFinal.item1,
            data: requestFinal.item3,
            options: Options(headers: requestFinal.item2));

        return ResponseModel<T>.fromJson(
            json.decode(response.data.toString()), response.statusCode);
      } on DioError catch (e) {
        return createErrorResponse(
            status: APIConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponse(
          status: APIConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }

  ResponseModel<T> createErrorResponse<T>(
      {required int status, required String message}) {
    return ResponseModel(status: status, message: message, data: null);
  }

  Future<ResponseModel<T>> uploadRequest<T>(APIType apiType,
      {Map<String, dynamic>? params,
      List<AppMultiPartFile>? arrFile,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = APIConstant.requestParamsForSync(apiType,
          params: params, arrFile: arrFile ?? []);

      Map<String, dynamic> other = <String, dynamic>{};
      other.addAll(requestFinal.item3);

      /* Adding File Content */
      for (AppMultiPartFile partFile in requestFinal.item4) {
        List<MultipartFile> uploadFiles = [];
        for (File file in partFile.localFiles ?? []) {
          String filename = basename(file.path);

          /// PDF Media
          if (filename.toLowerCase().contains(".pdf")) {
            MultipartFile mFile =
                await MultipartFile.fromFile(file.path, filename: filename);
            uploadFiles.add(mFile);
          }

          /// Video Media
          else if (filename.toLowerCase().contains(".mp4") ||
              filename.toLowerCase().contains(".mov") ||
              filename.toLowerCase().contains(".mkv")) {
            MultipartFile mFile = await MultipartFile.fromFile(file.path,
                filename: filename,
                contentType: MediaType('video', filename.split(".").last));
            uploadFiles.add(mFile);
          }

          /// Image Media
          else {
            MultipartFile mFile = await MultipartFile.fromFile(file.path,
                filename: filename,
                contentType: MediaType('image', filename.split(".").last));
            uploadFiles.add(mFile);
          }
        }
        if (uploadFiles.isNotEmpty) {
          other[partFile.key ?? ""] =
              (uploadFiles.length == 1) ? uploadFiles.first : uploadFiles;
        }
      }

      FormData formData = FormData.fromMap(other);
      final option = Options(headers: requestFinal.item2);

      try {
        final response = await dio.post(
          requestFinal.item1,
          data: formData,
          options: option,
          onSendProgress: (sent, total) {
            var progress = sent / total;
            Logger().v("uploadFile $progress");
          },
        );

        return ResponseModel<T>.fromJson(
            json.decode(response.data.toString()), response.statusCode);
      } on DioError catch (error) {
        return createErrorResponse(
            status: APIConstant.statusCodeBadGateway, message: error.message);
      }
    } else {
      return createErrorResponse(
          status: APIConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }
}
