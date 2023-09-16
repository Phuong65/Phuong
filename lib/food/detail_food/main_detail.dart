import 'package:app_todays_food/datafirebase/data_foods.dart';
import 'package:app_todays_food/food/detail_food/item_list.dart';
import 'package:app_todays_food/food/detail_food/list_item.dart';
import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:flutter/material.dart';

class main_detail extends StatefulWidget {
  main_detail({super.key, required this.item});

  var item;

  @override
  State<main_detail> createState() => _main_detailState();
}

class _main_detailState extends State<main_detail> {
  late Future<List<String>> stringListFuture;
  late Future<List<String>> stringListFuturea;

  @override
  void initState() {
    super.initState();
    stringListFuture = data_foods()
        .getListFromRealtimeDatabase('ingredient', widget.item.id.toString());
    stringListFuturea = data_foods()
        .getListFromRealtimeDatabase('step', widget.item.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sized_Box(w: 0, h: 25),
            Stack(
              children: [
                Image.network(
                  widget.item.image,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 5),
                  child: Positioned(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 30,
                    ),
                  )),
                )
              ],
            ),
            Sized_Box(w: 0, h: 5),
            Padding(padding: EdgeInsets.only(left: 10), child: Text(
              widget.item.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),),

            Sized_Box(w: 0, h: 10),
            Center(
              child: Text('THÀNH PHẦN DINH DƯỠNG',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            Sized_Box(w: 0, h: 10),
            Padding(padding: EdgeInsets.only(left: 10), child: Text(
              'Thành phần:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),),

            FutureBuilder<List<String>>(
              future: stringListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Text('No data available');
                } else {
                  List<String> stringList = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: stringList.length,
                    itemBuilder: (context, index) {
                      return item_list(item: stringList[index], index: index);
                    },
                  );
                }
              },
            ),
            Padding(padding: EdgeInsets.only(left: 10), child: Text(
              'Các bước:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
            ),),
            FutureBuilder<List<String>>(
              future: stringListFuturea,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Text('No data available');
                } else {
                  List<String> stringList = snapshot.data!;
                  List<int> step = data_foods().createNumberList(stringList.length);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: stringList.length,
                    itemBuilder: (context, index) {
                      return list_item(
                        index: index,
                        stringList: stringList[index], // Truyền danh sách stringList
                        step: step[index], // Truyền danh sách step
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
