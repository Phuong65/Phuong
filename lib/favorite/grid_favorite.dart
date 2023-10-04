import 'package:app_todays_food/datafirebase/auth.dart';
import 'package:app_todays_food/datafirebase/data_foods.dart';
import 'package:app_todays_food/favorite/container_favorite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class grid_favorite extends StatefulWidget {
  grid_favorite({super.key});

  @override
  State<grid_favorite> createState() => _grid_favoriteState();
}

class _grid_favoriteState extends State<grid_favorite> {
  Future<List<String>>? _typefListFuture;
  bool isLoggedIn = false;



  void checkLoginStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      _typefListFuture =
          data_foods().getListFromRealtimeDatabase('favorite', auth().getid());
    });

    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _typefListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(); // Hiển thị tiến trình đợi nếu dữ liệu đang được tải
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: isLoggedIn ? Text('Chưa có món ăn yêu thích') : Text('Bạn chưa đăng nhập')); // Xử lý trường hợp không có dữ liệu
        } else {
          final List<String> list = snapshot.data!;
          return GridView.builder(
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
              return container_favorite(item: list[index]);
            },
          );
        }
      },
    );
  }
}
