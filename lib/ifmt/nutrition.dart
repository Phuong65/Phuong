import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:flutter/material.dart';
class nutrition extends StatelessWidget {
  nutrition({super.key, required this.item});
  String item;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(scrollDirection: Axis.vertical,
      child: Column(

        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Sized_Box(w: 10, h: 0),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                ),
                Sized_Box(w: 20, h: 0),
                Text(
                  item,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Center(
          //   child: Text(item, style: TextStyle(fontSize: 20),),
          // ),
        ],
      ),
    );
  }
}
