import 'package:app_todays_food/controllers/test_user.dart';
import 'package:app_todays_food/datafirebase/auth.dart';
import 'package:app_todays_food/item_custom/toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_todays_food/item_custom/dialog.dart';
class bottom_dangky extends StatefulWidget {
  const bottom_dangky({super.key});

  @override
  State<bottom_dangky> createState() => _bottom_dangkyState();
}

class _bottom_dangkyState extends State<bottom_dangky> {
  late String email;
  late String password;
  late String passworda;
  late String name;
  User? user = FirebaseAuth.instance.currentUser;
  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  





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
                name = text;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                prefixIcon: Icon(Icons.account_circle),
                labelText: 'Tên tài khoản',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (text) {
                email = text;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.email),
                focusedBorder: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (text) {
                password = text;
              },
              obscureText: true, // Thiết lập thuộc tính này thành true để ẩn mật khẩu
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                prefixIcon: Icon(Icons.password),
                labelText: 'Mật khẩu',


                // hintText: 'Nhập mật khẩu của bạn',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (text) {
                passworda = text;
              },
              obscureText: true, // Thiết lập thuộc tính này thành true để ẩn mật khẩu
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.password),
                labelText: 'Nhập lại mật khẩu',


                // hintText: 'Nhập mật khẩu của bạn',
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
                    if(test_user().test_password(password, passworda) == 1){
                      auth().signUpWithEmailAndPassword(email, password, name);
                      dialog().showLoadingDialog(context);
                      showToast(context, 'Đăng nhập thành công');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.lightBlueAccent),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
