import 'package:app_todays_food/main.dart';
import 'package:app_todays_food/profile/prenium.dart';
import 'package:flutter/material.dart';

class dialog {
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Không cho phép đóng dialog khi chạm bên ngoài
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text("Vui lòng đợi..."),
            ],
          ),
        );
      },
    );

    // Sau một khoảng thời gian giả định, bạn có thể đóng dialog bằng cách sử dụng Navigator
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    });
  }

  void dialod_prenium(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Không cho phép đóng dialog khi chạm bên ngoài
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              prenium(),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Đóng')),
            ],
          ),
        );
      },
    );
  }
}
