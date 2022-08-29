import 'package:assement/Utils/constants.dart';
import 'package:flutter/cupertino.dart';

class CompleteAddRaaflale extends StatelessWidget {
  const CompleteAddRaaflale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(AppImages.checkBox),
        )
      ],
    );
  }
}
