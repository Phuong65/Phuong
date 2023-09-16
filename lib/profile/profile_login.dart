import 'package:app_todays_food/item_custom/Sized_Box.dart';
import 'package:app_todays_food/item_custom/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:app_todays_food/datafirebase/auth.dart';
import 'package:app_todays_food/main.dart';
import 'package:app_todays_food/item_custom/toast.dart';

class profile_login extends StatefulWidget {
  const profile_login({super.key});

  @override
  State<profile_login> createState() => _profile_loginState();
}

class _profile_loginState extends State<profile_login> {
  String image = '';
  String name = '';
  String username = auth().getemail();
  String id = auth().getid();
  bool prenium = false;
  bool dataLoaded = false;

  void fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      dataLoaded = true;
    });
  }

  Future<void> getuser() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/$id').get();
    print('users/$id');
    if (snapshot.exists) {
      print(snapshot.value);
      final data = snapshot.value as Map<Object?, Object?>;
      var imagea = data['image'];
      var namea = data['name'];
      var premiuma = data['prenium'].toString();
      setState(() {
        image = imagea.toString();
        name = namea.toString();
        prenium = (premiuma.toLowerCase() == 'true') ? true : false;
      });
      print(name);
    } else {
      print('No data available.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
              children: [
                Sized_Box(w: 0, h: 100),
                dataLoaded ? ClipOval(
                  child: Image.network(
                    image,
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ): Center(
                  child: CircularProgressIndicator(), // Hiển thị tiến trình chờ
                ),
                Sized_Box(w: 0, h: 20),
                Text(
                  'Email: $username',
                  style: TextStyle(fontSize: 20, fontFamily: 'font', fontWeight: FontWeight.bold),
                ),
                Sized_Box(w: 0, h: 20),
                Text(
                  'Tên tài khoản: $name',
                  style: TextStyle(fontSize: 20, fontFamily: 'font', fontWeight: FontWeight.bold),
                ),
                Sized_Box(w: 0, h: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Prenium: $prenium',
                      style: TextStyle(fontSize: 20, fontFamily: 'font', fontWeight: FontWeight.bold),
                    ),
                    Sized_Box(w: 5, h: 0),
                    Text(
                      '(*)',
                      style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
                Sized_Box(w: 0, h: 50),
                Center(
                  child: SizedBox(
                    width: null,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                         if(prenium == true){
                           showToast(context, 'Bạn đã đăng ký Premium');
                         }else{
                           dialog().dialod_prenium(context);
                         }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent,
                          side: BorderSide(color: Colors.amber),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(
                          'Nâng cấp Premium',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ),
                Sized_Box(w: 0, h: 20),
                Text(
                  '(*) Đăng ký Prenium để có thể có trải nghiệm tốt nhất',
                  style: TextStyle(color: Colors.grey, fontFamily: 'font', fontSize: 13),
                ),
              ],
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        },
        child: Icon(
          Icons.logout,
          size: 30,
        ),
      ),
    );
  }
}
