import 'package:app_todays_food/food/grid_foods.dart';
import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:app_todays_food/main.dart';
import 'package:flutter/material.dart';

class main_food extends StatelessWidget {
  main_food({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  Sized_Box(w: 20, h: 0),
                  Text(
                    title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Sized_Box(w: 0, h: 20),
            SizedBox(
              width: double.infinity,
              height: 10000,
              child: grid_foods(title: title),
            ),
          ],
        ),
      ),
    );
  }
}
