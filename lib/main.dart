import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_todays_food/tabs.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'font',
      scaffoldBackgroundColor: Colors.white,// Đặt font chữ mặc định
      // Các thiết lập khác cho chủ đề của ứng dụng
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int current_Index = 0;

  final tabS = tab;



  @override
  void initState() {
    super.initState();
    // Gọi hàm của bạn tại đây khi widget được khởi tạo
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: tabS[current_Index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 13,
          unselectedFontSize: 10,
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Yêu thích'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Tìm kiếm'),
            BottomNavigationBarItem(icon: Icon(Icons.perm_device_info_outlined), label: 'Thông Tin'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Tài khoản',),
          ],
          currentIndex: current_Index,

          //setsukien
          onTap: (index) {
            setState(() {
              current_Index = index;
            });
          },
        ),
      ),
    );
  }
}
