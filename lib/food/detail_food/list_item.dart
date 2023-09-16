import 'package:flutter/material.dart';

class list_item extends StatelessWidget {
  list_item({Key? key, required this.stringList, required this.index, required this.step})
      : super(key: key);
  final int index;

  var stringList;
  var step;
  Color customColor = Color(0xA5EEEBEB);

  @override
  Widget build(BuildContext context) {
    Color itemColor =
        index.isEven ? customColor : Colors.white; // Chọn màu xen kẽ
    return Container(
      width: double.infinity,
      color: itemColor,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 10, right: 10), // Lùi sang phải 10px
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
           'Bước ${step}: ${stringList}',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}