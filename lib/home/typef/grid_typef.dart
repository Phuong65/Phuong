import 'package:app_todays_food/Models/Typef.dart';
import 'package:flutter/material.dart';
import 'package:app_todays_food/home/typef/container_typef.dart';
import 'package:app_todays_food/datafirebase/data_foods.dart';

class grid_typef extends StatefulWidget {
  grid_typef({super.key});

  @override
  State<grid_typef> createState() => _typefState();
}

class _typefState extends State<grid_typef> {
  Future<List<Typef>>? _typefListFuture;

  @override
  void initState() {
    super.initState();
    _typefListFuture = data_foods().getlist();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Typef>>(
      future: _typefListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(); // Hiển thị tiến trình đợi nếu dữ liệu đang được tải
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available'); // Xử lý trường hợp không có dữ liệu
        } else {
          final List<Typef> list = snapshot.data!;
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 13),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 13.0,
              crossAxisSpacing: 13.0,
              childAspectRatio: 0.65,
            ),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              final item = list[index];
              return container_typef(item: item);
            },
          );
        }
      },
    );
  }
}
