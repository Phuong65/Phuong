import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:flutter/material.dart';

class nutrition extends StatefulWidget {
  nutrition({super.key, required this.item, required this.title});
  String title;
  String item;

  @override
  State<nutrition> createState() => _nutritionState();
}

class _nutritionState extends State<nutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Sized_Box(w: 0, h: 20),
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
                    widget.title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.item,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
