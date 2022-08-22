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
  String? search;
  String? price;
  int offset;
  int limit;
  int? categoryId;
  int? ticketPriceId;
  String? createdAt;
  String? sort;

  SearchController(
      {this.search,
      this.price,
      this.categoryId,
      this.createdAt,
      this.sort,
      this.ticketPriceId,
      required this.limit,
      required this.offset});

  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    fetchRaffleList();
  }

  fetchRaffleList() async {
    RaffleAPIModel apiModel = RaffleAPIModel(limit: limit, offset: offset);

    final params = apiModel.toJson();

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
