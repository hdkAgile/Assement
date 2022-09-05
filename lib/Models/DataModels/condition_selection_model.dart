import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../Utils/enum_all.dart';
import 'Dashboard.dart';

class ConditionSelectionModel {
  ConditionType type;
  bool isSelected;

  ConditionSelectionModel({required this.type, required this.isSelected});
}

class CategorySelectionModel {
  Banners category;
  bool isSelected;

  CategorySelectionModel({required this.category, required this.isSelected});
}
