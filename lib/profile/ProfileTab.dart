import 'package:app_todays_food/profile/profile_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_todays_food/profile/profile.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool isLoggedIn = false;

  void checkLoginStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Gọi hàm của bạn tại đây khi widget được khởi tạo
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return profile_login();
    } else {
      return profile();
    }
  }
}
