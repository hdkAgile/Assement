import 'package:assement/Controllers/alert_managar_controller.dart';
import 'package:assement/Models/DataModels/response_model.dart';
import 'package:assement/Models/DataModels/wallet.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Utils/network_manager/api_constant.dart';
import 'package:assement/Utils/network_manager/remote_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  Rxn<Wallet> wallet = Rxn(null);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getWalletAmount(BuildContext context) async {
    ResponseModel<Wallet> responseModel = await sharedServiceManager
        .createGetRequest(typeOfEndPoint: APIType.getWalletAmount);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      wallet.value = responseModel.data;
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }
}
