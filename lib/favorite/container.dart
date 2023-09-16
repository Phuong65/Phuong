import 'package:app_todays_food/Models/foods.dart';
import 'package:app_todays_food/datafirebase/data_foods.dart';
import 'package:app_todays_food/favorite/container_favorite.dart';
import 'package:flutter/material.dart';
class container extends StatefulWidget {
  container({super.key, required this.item});
  var item;

  @override
  State<container> createState() => _containerState();
}

class _containerState extends State<container> {
  Future<List<foods>>? _typefListFuture;

  @override
  void initState() {
    super.initState();

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

          return Container();
        }
      },
    );;
  }
}
