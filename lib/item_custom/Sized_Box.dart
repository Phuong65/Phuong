import 'package:flutter/material.dart';
class Sized_Box extends StatelessWidget {
  Sized_Box({Key? key, required this.w, required this.h}) : super(key: key);
  final double w, h;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}
