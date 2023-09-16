import 'package:app_todays_food/Models/foods.dart';
import 'package:app_todays_food/datafirebase/data_foods.dart';
import 'package:app_todays_food/home/food_random/container_food.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'dart:ui';

class grid_foodrandom extends StatefulWidget {
  grid_foodrandom({super.key});

  @override
  State<grid_foodrandom> createState() => _food_favoritesState();
}

class _food_favoritesState extends State<grid_foodrandom>
    with SingleTickerProviderStateMixin {
  Future<List<foods>>? _typefListFuture;

  late AnimationController yourAnimationController;

  @override
  void initState() {
    super.initState();
    _typefListFuture = data_foods().getlistrandom();
    yourAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    yourAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<foods>>(
      future: _typefListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          ); // Hiển thị tiến trình đợi nếu dữ liệu đang được tải
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available'); // Xử lý trường hợp không có dữ liệu
        } else {
          final List<foods> list = snapshot.data!;
          return GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 50),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Số cột trong grid
                mainAxisSpacing: 10.0, // Khoảng cách giữa các hàng
                crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
                childAspectRatio:
                    1.2, // Tỷ lệ chiều rộng / chiều cao của mỗi item
              ),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                final item = list[index];
                return FadeScaleTransition(
                  animation: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(CurvedAnimation(
                    parent: yourAnimationController, // Điều khiển animation
                    curve: Interval(0.5 * index, 1.0, curve: Curves.easeInOut),
                  )),
                  child: container_food(item: item, premium: item.premium),
                );
              });
        }
      },
    );
  }

  @override
  void dispose() {
    yourAnimationController.dispose();
    super.dispose();
  }
}

// SlideTransition(
// position: Tween<Offset>(
// begin: Offset(0, -1), // Điểm bắt đầu của vị trí
// end: Offset(0, 0),   // Điểm kết thúc của vị trí (mặc định)
// ).animate(CurvedAnimation(
// parent: yourAnimationController,
// curve: Interval(0.5 * index, 1.0, curve: Curves.easeInOut),
// )),
// child: container_food(item: item),
// );
