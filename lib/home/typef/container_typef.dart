import 'package:app_todays_food/food/main_food.dart';
import 'package:flutter/material.dart';

class container_typef extends StatelessWidget {
  container_typef({super.key, required this.item});

  var item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => main_food(
                      title: item.name,
                    )));
      },
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.maxFinite,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                image: NetworkImage(
                  item.image,
                ),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
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
