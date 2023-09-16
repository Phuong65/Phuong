import 'package:app_todays_food/item_custom/toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_todays_food/item_custom/dialog.dart';

class bottom_dangnhap extends StatefulWidget {
  bottom_dangnhap({super.key});

  @override
  State<bottom_dangnhap> createState() => _bottom_dangnhapState();
}

class _bottom_dangnhapState extends State<bottom_dangnhap> {
  late String email;

  late String password;

  void signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user);
      print('Thành công');

      // Xác thực thành công, userCredential.user chứa thông tin người dùng đăng nhập
    } catch (e) {
      // Xác thực thất bại, xử lý lỗi ở đây
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        // color: Colors.black45,
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                email = text;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),


                prefixIcon: Icon(Icons.email),
                labelText: 'Tài khoản',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (text) {
                password = text;
              },
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.password),
                labelText: 'Mật khẩu',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    dialog().showLoadingDialog(context);
                    signInWithEmailAndPassword(email, password);


                    showToast(context, 'Đăng nhập thành công');
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.lightBlueAccent),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
