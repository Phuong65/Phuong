import 'package:app_todays_food/favorite/grid_favorite.dart';
import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:flutter/material.dart';
class main_favorite extends StatefulWidget {
  const main_favorite({super.key});

  @override
  State<main_favorite> createState() => _main_favoriteState();
}

class _main_favoriteState extends State<main_favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Sized_Box(w: 0, h: 50),
          Text('Favorite'),
          Sized_Box(w: 0, h: 20),
          SizedBox(
            width: double.infinity,


            height: 500,
            child: grid_favorite(),
          )
        ],
      ),
    );
  }
}
