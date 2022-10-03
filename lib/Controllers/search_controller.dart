import 'package:assement/Utils/constants.dart';
import 'package:get/get.dart';
import '../Models/DataModels/app_user.dart';
import '../Models/DataModels/raffale_list.dart';
import '../Models/DataModels/response_model.dart';
import '../Models/ParamsModels/RaffleAPIModel.dart';
import '../Utils/enum_all.dart';
import '../Utils/network_manager/api_constant.dart';
import '../Utils/network_manager/remote_services.dart';
import 'alert_managar_controller.dart';

class SearchController extends GetxController {
  RxList<Raffale> items = <Raffale>[].obs;
  SingleUser user = sharedUser.user;
  int page = 0;

  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    fetchRaffleList();
  }

  fetchRaffleList({String? search}) async {
    Map<String, dynamic> params = {};

    if (search != null) {
      params['search'] = search;
    }

    params['limit'] = AppConstant.limit;
    params['offset'] = page;

    isLoading.value = true;
    ResponseModel<RaffaleList> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.raffle, params: params);
    isLoading.value = false;

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      final raffleData = responseModel.data;
      if (raffleData != null) {
        items.value = raffleData.data ?? [];
      }
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }
}
