import 'package:flutter/material.dart';

class item_list extends StatelessWidget {
  item_list({Key? key, required this.item, required this.index})
      : super(key: key);
  var item;
  final int index;

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
        margin: EdgeInsets.only(left: 10), // Lùi sang phải 10px
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              item,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),

            ),
          ),],
        ),
      ),
    );
  }
}
