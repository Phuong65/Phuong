import 'package:app_todays_food/Models/foods.dart';
import 'package:app_todays_food/datafirebase/data_foods.dart';
import 'package:app_todays_food/food/container_foods.dart';
import 'package:flutter/material.dart';

class grid_foods extends StatefulWidget {
  grid_foods({super.key, required this.title});

  String title;

  @override
  State<grid_foods> createState() => _list_foodsState();
}

class _list_foodsState extends State<grid_foods> {
  Future<List<foods>>? _typefListFuture;

  @override
  void initState() {
    super.initState();
    _typefListFuture = data_foods().getlistfoods();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<foods>>(
      future: _typefListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Hiển thị tiến trình đợi nếu dữ liệu đang được tải
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available'); // Xử lý trường hợp không có dữ liệu
        } else {
          final List<foods> list = snapshot.data!;
          final List<foods> listz =
              data_foods().getlisttitle(list, widget.title);
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 13),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 13.0,
              crossAxisSpacing: 13.0,
              childAspectRatio: 0.65,
            ),
            itemCount: listz.length,
            itemBuilder: (BuildContext context, int index) {
              final item = listz[index];
              return container_foods(
                item: item,
                premium: item.premium,
              );
            },
          );
        }
      },
    );
  }
}
