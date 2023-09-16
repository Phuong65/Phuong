import 'package:app_todays_food/Models/foods.dart';
import 'package:app_todays_food/datafirebase/auth.dart';
import 'package:app_todays_food/datafirebase/data_foods.dart';
import 'package:app_todays_food/food/detail_food/main_detail.dart';
import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:app_todays_food/item_custom/toast.dart';
import 'package:flutter/material.dart';
class container_favorite extends StatefulWidget {
  container_favorite({super.key, required this.item});
  var item;
 
  @override
  State<container_favorite> createState() => _container_favoriteState();
}

class _container_favoriteState extends State<container_favorite> {
  bool premium = false;

  Future<List<foods>>? _typefListFuture;
  @override
  void initState() {
    super.initState();

    setState(() {
      _typefListFuture = data_foods().getlistfoods();
    });
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
          final List<foods> listz =
          data_foods().getlistfavorite(list, int.parse(widget.item));
          final items = listz[0];
          return InkWell(
            onTap: () async {
  if (items.premium == true) {
    if (items.premium == await auth().getpremium()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => main_detail(item: items)));
    } else {
      showToast(context, 'Bạn chưa đăng ký Premium hoặc chưa đăng nhập');
      print('premium ${await auth().getpremium()}');
    }
  } else {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => main_detail(item: items)));
  }
            },
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
// Màu và độ trong suốt của độ nổi
                    spreadRadius: 2,
// Độ phân tán của độ nổi
                    blurRadius: 5,
// Độ mờ của độ nổi
                    offset: Offset(0, 1), // Độ dịch chuyển độ nổi
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: Image.network(
                      items.image,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Sized_Box(w: 0, h: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      items.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Sized_Box(w: 0, h: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Số bước: ${items.step_count}',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Sized_Box(w: 0, h: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Thành phần: ${items.ingredient_count}',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                      items.premium
                          ? Image.network(
                        'https://cdn-icons-png.flaticon.com/128/6941/6941697.png',
                        width: 20,
                        height: 20,
                      )
                          : Image.network(
                        'https://cdn-icons-png.flaticon.com/128/891/891438.png',
                        width: 20,
                        height: 20,
                      ),
                      Sized_Box(w: 5, h: 0),
                      InkWell(
                        onTap: () async {
                          await data_foods().removeListFavorite(auth().getid(), items.id.toString());
                          showToast(context, 'Đã xóa danh sách favorite');
                        },



                        child: Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
