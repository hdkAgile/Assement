import 'package:flutter/material.dart';

class AppBarComponents {
  static AppBar appBar({
    Color? backgroundColor,
    double? elevation,
    Widget? title,
    PreferredSizeWidget? bottom,
    List<Widget>? actions,
    Widget? leading,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      title: title,
      bottom: bottom,
      actions: actions,
      leading: leading,
    );
  }
}
