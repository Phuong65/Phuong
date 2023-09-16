import 'package:app_todays_food/home/food_random/grid_foodrandom.dart';
import 'package:app_todays_food/home/meals/grid_meals.dart';
import 'package:app_todays_food/home/typef/grid_typef.dart';
import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Dành cho bạn', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Sized_Box(w: 0, h: 20),
            SizedBox(
              width: double.infinity,
              height: 85,
              child: grid_meals(),
            ),
            Sized_Box(w: 0, h: 20),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: grid_foodrandom(),
            ),
            Sized_Box(w: 0, h: 20),
            Text('Categori', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Sized_Box(w: 0, h: 20),
            SizedBox(
              width: double.infinity,
              height: 785,
              child: grid_typef(),
            ),
          ],
        ),
      ),
    );
  }
}
