import 'package:flutter/material.dart';

class CustomeDivider extends StatelessWidget {
  const CustomeDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      color: Colors.grey.shade900,
    );
  }
}
