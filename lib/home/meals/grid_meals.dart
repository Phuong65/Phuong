import 'package:app_todays_food/home/meals/container_meals.dart';
import 'package:flutter/material.dart';
import 'package:app_todays_food/Models/Meals.dart';

class grid_meals extends StatefulWidget {
  grid_meals({super.key});

  @override
  State<grid_meals> createState() => _mealsState();
}

class _mealsState extends State<grid_meals> {
  final List<Meals> list = [
    Meals(
        id: 0,
        name: 'Bữa sáng',
        image:
            'https://cdn-icons-png.flaticon.com/128/887/887396.png'),
    Meals(
        id: 1,
        name: 'Bữa trưa',
        image:
            'https://cdn-icons-png.flaticon.com/128/3274/3274083.png'),
    Meals(
        id: 2,
        name: 'Bữa tối',
        image:
            'https://cdn-icons-png.flaticon.com/128/2555/2555857.png'),
    Meals(
        id: 3,
        name: 'Bữa phụ',
        image:
            'https://cdn-icons-png.flaticon.com/128/2137/2137628.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.only(left: 10, right: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Số cột trong grid
          mainAxisSpacing: 10.0, // Khoảng cách giữa các hàng
          crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
          childAspectRatio: 1.0, // Tỷ lệ chiều rộng / chiều cao của mỗi item
        ),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final item = list[index];
          return container_meals(item: item);
        });
  }
}
