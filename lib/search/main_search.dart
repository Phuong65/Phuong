import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:flutter/material.dart';
class main_search extends StatefulWidget {
  const main_search({super.key});

  @override
  State<main_search> createState() => _main_searchState();
}

class _main_searchState extends State<main_search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Sized_Box(w: 0, h: 50),
          Text('search'),
      TextField(
        decoration: InputDecoration(
          hintText: 'Tìm kiếm...',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Gọi hàm tìm kiếm khi người dùng nhấn nút tìm kiếm
            },
          ),
        ),
      ),
        ],
      ),
    );
  }
}
