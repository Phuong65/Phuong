import 'package:app_todays_food/datafirebase/auth.dart';
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
  bool icon = false;

  Future<List<String>>? _typefListFuture;
  @override
  void initState() {
    super.initState();
    stringListFuture = data_foods()
        .getListFromRealtimeDatabase('ingredient', widget.item.id.toString());
    stringListFuturea = data_foods()
        .getListFromRealtimeDatabase('step', widget.item.id.toString());
    _typefListFuture =
        data_foods().getListFromRealtimeDatabase('favorite', auth().getid());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: _typefListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),); // Hiển thị tiến trình đợi nếu dữ liệu đang được tải
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return w(widget, icon); // Xử lý trường hợp không có dữ liệu
          } else {
            final List<String> list = snapshot.data!;
            final bool icon = data_foods().seticon(
                widget.item.id.toString(), list);


            return w(widget, icon);
          }
        },
      ),
    );
  }
  Widget w(main_detail widget, icon){
    return  Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 26,
            child: Container(
              width: double.maxFinite,
              height: 330,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.item.image,
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
          ),

          Positioned(
            top: 30,
            right: 10,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined, size: 30),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      icon ? Icons.favorite :  Icons.favorite_outline,
                      // Chọn biểu tượng dựa trên điều kiện
                      size: 30, // Kích thước của biểu tượng




                      color: icon ? Colors
                          .red : Colors.black, // Màu sắc của biểu tượng
                    ),
                  ),
                ],
              ),
            ),
          ),


          Positioned(
            top: 250,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 250,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                widget.item.name,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 300,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(65)),
              ),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Sized_Box(w: 0, h: 20),
                   Padding(
                     padding: EdgeInsets.only(left: 10),
                      child: Text('THÀNH PHẦN DINH DƯỠNG',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                    Sized_Box(w: 0, h: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Thành phần:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FutureBuilder<List<String>>(
                      future: stringListFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.data == null ||
                            snapshot.data!.isEmpty) {
                          return Text('No data available');
                        } else {
                          List<String> stringList = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: stringList.length,
                            itemBuilder: (context, index) {
                              return item_list(
                                  item: stringList[index], index: index);
                            },
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Các bước:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FutureBuilder<List<String>>(
                      future: stringListFuturea,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.data == null ||
                            snapshot.data!.isEmpty) {
                          return Text('No data available');
                        } else {
                          List<String> stringList = snapshot.data!;
                          List<int> step = data_foods()
                              .createNumberList(stringList.length);
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: stringList.length,
                            itemBuilder: (context, index) {
                              return list_item(
                                index: index,
                                stringList: stringList[index],
// Truyền danh sách stringList
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
            ),
          ),
        ],
      ),
    );
  }
}
