import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:flutter/material.dart';

class prenium extends StatelessWidget {
  const prenium({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Sized_Box(w: 0, h: 5),
          Text('Bạn có thể chuyển khoản qua tài khoản sau: ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
          Sized_Box(w: 0, h: 5),
          Text("STK: 109870713149", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
          Sized_Box(w: 0, h: 5),
          Text('Chủ tài khoản: LÝ NAM PHƯƠNG', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
          Sized_Box(w: 0, h: 5),
          Text('Ngân hàng: Viettinbank', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
          Sized_Box(w: 0, h: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/apptodayfood-1172a.appspot.com/o/image_icon%2Fphoto_2023-09-10_03-16-03.jpg?alt=media&token=3e853bc8-9b12-47c9-b5a6-5d5245e85559',
              width: double.infinity,
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
          Sized_Box(w: 0, h: 5),
          Text(
            'Phí đăng ký là: 10000VNĐ/Tháng',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          Sized_Box(w: 0, h: 5),
          Text(
            'Do tool chạy bằng cơm nên thời gian update có thể lâu',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
