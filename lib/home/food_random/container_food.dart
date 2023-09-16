import 'package:app_todays_food/datafirebase/auth.dart';
import 'package:app_todays_food/datafirebase/data_foods.dart';
import 'package:app_todays_food/food/detail_food/main_detail.dart';
import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:app_todays_food/item_custom/toast.dart';
import 'package:app_todays_food/main.dart';
import 'package:flutter/material.dart';

class container_food extends StatefulWidget {
  container_food({super.key, required this.item, required this.premium});

  var item;

  bool premium;

  @override
  State<container_food> createState() => _container_foodState();
}

class _container_foodState extends State<container_food> {
  Future<List<String>>? _typefListFuture;

  @override
  void initState() {
    super.initState();
    _typefListFuture =
        data_foods().getListFromRealtimeDatabase('favorite', auth().getid());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _typefListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          ); // Hiển thị tiến trình đợi nếu dữ liệu đang được tải
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return myCustomWidget(
              widget, context, false); // Xử lý trường hợp không có dữ liệu
        } else {
          final List<String> list = snapshot.data!;
          final bool icon =
              data_foods().seticon(widget.item.id.toString(), list);
          return myCustomWidget(widget, context, icon);
        }
      },
    );
  }
}

Widget myCustomWidget(container_food widget, BuildContext context, bool icon) {
  return InkWell(
    onTap: () async {
      if (widget.premium == true) {
        if (widget.premium == await auth().getpremium()) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        } else {
          showToast(context, 'Bạn chưa đăng ký Premium hoặc chưa đăng nhập');
          print('premium ${await auth().getpremium()}');
        }
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => main_detail(item: widget.item)));
      }
    },
    child: Container(
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
              widget.item.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              widget.item.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Sized_Box(w: 0, h: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Số bước: ${widget.item.step_count}',
              style: TextStyle(fontSize: 13),
            ),
          ),
          Sized_Box(w: 0, h: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Thành phần: ${widget.item.ingredient_count}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.premium
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
                  InkWell(
                    onTap: () async {
                      if (icon == false) {
                        try {
                          await data_foods().addListFavorite(
                              auth().getid(), widget.item.id.toString());
                          showToast(context, 'Đã thêm vào danh sách favorite');
                        } catch (err) {
                          print(err);
                        }
                      } else {
                        await data_foods().removeListFavorite(
                            auth().getid(), widget.item.id.toString());
                        showToast(context, 'Đã xóa danh sách favorite');
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: Icon(
                        icon ? Icons.favorite : Icons.favorite_outline,
                        // Chọn biểu tượng dựa trên điều kiện
                        size: 30, // Kích thước của biểu tượng

                        color: icon
                            ? Colors.red
                            : Colors.black, // Màu sắc của biểu tượng
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}
// aaaaaaaaaaaaaaaaaa
