import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoView extends StatelessWidget {
  const DemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jaadu"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Hardik"), Text("Modha")],
        ),
      ),
    );
  }
}
