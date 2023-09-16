import 'package:app_todays_food/food/main_food.dart';
import 'package:flutter/material.dart';

class container_typef extends StatelessWidget {
  container_typef({super.key, required this.item});

  var item;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => main_food(title: item.name,)));
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Center(
                child: Text(
                  item.name,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
