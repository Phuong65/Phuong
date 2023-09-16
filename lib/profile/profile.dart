import 'package:flutter/material.dart';
import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:app_todays_food/profile/bottom_dangnhap.dart';
import 'package:app_todays_food/profile/bottom_dangky.dart';
import 'dart:ui';
class profile extends StatefulWidget {
  profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            'TÀI KHOẢN',
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
            "https://firebasestorage.googleapis.com/v0/b/apptodayfood-1172a.appspot.com/o/image_icon%2Fconnect.png?alt=media&token=b73e5e38-fcec-4662-a477-f4adf79759d0",
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
          Sized_Box(w: 0, h: 20),
          Text('Khám phá thêm nhiều món ăn hơn dành cho bạn',style: TextStyle(fontWeight: FontWeight.bold,),),
          Sized_Box(w: 0, h: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return bottom_dangnhap();
                        });
                  },
                  child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/apptodayfood-1172a.appspot.com/o/image_icon%2Fenvelope.png?alt=media&token=52354907-beac-4ee7-86dc-d00d3c953981",
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                Sized_Box(w: 10, h: 0),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return bottom_dangnhap();
                        });
                  },
                  child: Text(
                    'Đăng nhập (*)',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Sized_Box(w: 0, h: 20),
          Text(
            'Đăng nhập ngay theo những cách sau',
            style: TextStyle(fontWeight: FontWeight.bold,),
          ),
          Sized_Box(w: 0, h: 20),
          InkWell(
            onTap: () {
              print('CLick');
            },
            child: Container(
              child: SizedBox(
                width: 265,
                height: 65,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/apptodayfood-1172a.appspot.com/o/image_icon%2Fgoogle.png?alt=media&token=9876ff03-c092-46ab-a3b3-5e5b4bd52586",
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                      Sized_Box(w: 10, h: 0),
                      Text(
                        'Google',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Sized_Box(w: 0, h: 20),
          Text('Bạn chưa có tài khoản ?',style: TextStyle(fontWeight: FontWeight.bold,),),
          Sized_Box(w: 0, h: 20),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return bottom_dangky();
                  });
            },
            child: Text(
              'Đăng ký nhanh',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Sized_Box(w: double.infinity, h: 165),
          Center(
            child: Text(
              '(*) Đăng nhập bằng tài khoản bạn đã đăng ký',
              style: TextStyle(color: Colors.grey, fontFamily: 'font', fontSize: 13),
            ),
          ),
          Sized_Box(w: double.infinity, h: 5),
          Center(
            child: Text(
              '(*) Mua tài khoản Prenium để có trải nghiệm tốt nhất',
              style: TextStyle(color: Colors.grey, fontFamily: 'font', fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
// aaaaaaaaaaaaaaaaaa
