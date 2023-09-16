import 'package:app_todays_food/datafirebase/data_foods.dart';
import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:flutter/material.dart';

class main_ifmt extends StatefulWidget {
  main_ifmt({super.key});

  @override
  State<main_ifmt> createState() => _main_ifmtState();
}

class _main_ifmtState extends State<main_ifmt> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sized_Box(w: 0, h: 50),
            InkWell(
              onTap: () {
              },
              child: Text(
                'Thông tin ứng dụng',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Sized_Box(w: 0, h: 10),
            InkWell(
              onTap: () {},
              child: Text(
                'Calories là gì ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Sized_Box(w: 0, h: 10),
            InkWell(
              onTap: () {},
              child: Text(
                'Fat là gì ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Sized_Box(w: 0, h: 10),
            InkWell(
              onTap: () {},
              child: Text(
                'Protein là gì ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// FutureBuilder<List<String>>(
// future: stringListFuture,
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return CircularProgressIndicator();
// } else if (snapshot.hasError) {
// return Text('Error: ${snapshot.error}');
// } else if (snapshot.data == null || snapshot.data!.isEmpty) {
// return Text('No data available');
// } else {
// List<String> stringList = snapshot.data!;
// return Container(
// child: SingleChildScrollView(
// padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
// child: Column(
// children: stringList.map((item) => item_list(item: item)).toList(),
// ),
// ),
// );
// }
// },
// );