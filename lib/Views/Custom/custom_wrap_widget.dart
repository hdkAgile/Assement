import 'package:assement/Models/DataModels/raffale_list.dart';
import 'package:assement/Views/Custom/product_grid_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Models/DataModels/dashboard.dart';

class CustomWrapWidget extends StatelessWidget {
  String? title;
  String? label;
  List<Raffale> items;

  CustomWrapWidget({
    Key? key,
    this.title,
    this.label,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title ?? ''),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward),
                label: Text(label ?? ''),
              ),
            ],
          ),
        ),
        Container(
          height: 250.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Wrap(
                //   spacing: 10,
                //   children: [
                //     ...List.generate(
                //       items.length,
                //       (index) {
                //         return ProductGridCell(raffale: items[index]));
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
