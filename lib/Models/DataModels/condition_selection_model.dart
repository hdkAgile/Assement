import 'dart:convert';

import '../../Utils/enum_all.dart';

class ConditionSelectionModel {
  ConditionType type;
  bool isSelected;

  ConditionSelectionModel({required this.type, required this.isSelected});
}
