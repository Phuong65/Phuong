import 'package:app_todays_food/food/main_food.dart';
import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:flutter/material.dart';

class container_meals extends StatelessWidget {
  container_meals({Key? key, required this.item}) : super(key: key);

  var item;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [Colors.white.withOpacity(0.5), Colors.grey],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomCenter,
          // ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              // Màu và độ trong suốt của độ nổi
              spreadRadius: 2,
              // Độ phân tán của độ nổi
              blurRadius: 10,
              // Độ mờ của độ nổi
              offset: Offset(0, 1), // Độ dịch chuyển độ nổi
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => main_food(title: item.name,)));
          },
          child: Column(children: [
            Sized_Box(w: 0, h: 5),
            Image.network(
              item.image,
              width: 50,
              height: 45,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            Center(
              child: Text(
                item.name,
                style: TextStyle(
                    fontFamily: 'font',
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                fontSize: 11),
              ),
            ),
          ]),
        ));
    ;
  }
}
