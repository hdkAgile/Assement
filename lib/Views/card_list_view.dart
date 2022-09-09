import 'package:assement/Controllers/card_controller.dart';
import 'package:assement/Controllers/check_out_controller.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Views/Custom/image_view.dart';
import 'package:assement/Views/add_card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CardListView extends StatelessWidget {
  CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardController controller = Get.put(CardController());
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        title: Text(AppText.paymentMethodDetail,
            style: AppTextStyle.openSans_semibold_black_18),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
                height: 17.h,
                width: 22.w,
                child: Image.asset(AppImages.backArrow,
                    color: AppColors.themeBlack))),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Visibility(
                visible: controller.cards.isNotEmpty,
                child: Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.cards.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.updateDefaultCard(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade100, width: 2.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '..... ${controller.cards[index].last4}',
                                  style: AppTextStyle
                                      .openSans_regular_themeBlack_14,
                                ),
                                Row(
                                  children: [
                                    Center(
                                      child: IconButton(
                                          onPressed: () {
                                            controller.deleteCard(
                                                index, context);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: AppColors.themeBlack,
                                          )),
                                    ),
                                    Image.asset(AppImages.blackArrowRight)
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(AddCardView())
                    ?.then((value) => controller.getCardList());
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade100, width: 2.0),
                ),
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Text(
                  'Add payment Method',
                  style: AppTextStyle.openSans_bold_themeGreen_14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
