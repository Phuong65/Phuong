import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class auth {
  User? user = FirebaseAuth.instance.currentUser;

  String getid() {
    final user = this.user;
    if (user != null) {
      return user.uid;
    } else {
      print('khong tim thay');
      return 'null';
    }
  }

  String getemail() {
    final user = this.user;
    if (user != null) {
      var a = user.email;
      return a.toString();
    } else {
      print('khong tim thay');
      return 'null';
    }
  }






  void signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user);
      User? user = userCredential.user;
      late final String userID;
      if (user != null) {
        userID = user.uid;
        print('User ID: $userID');
      } else {
        print('User is not authenticated.');
      }
      creatUser(userID, name);
      print('Thành công');
      // Xác thực thành công, userCredential.user chứa thông tin người dùng đăng nhập
    } catch (e) {
      // Xác thực thất bại, xử lý lỗi ở đây
    }
  }

  void creatUser(String userID, String name) {
    String image =
        'https://cdn-icons-png.flaticon.com/128/1999/1999625.png';
    var users = {"name": name, "image": image, "prenium": 'false'};
    var ref = FirebaseDatabase.instance.reference().child('users');
    ref.child(userID).set(users).then((users) {}).catchError((err) {});
  }

  Future<bool> getpremium() async {

      String id = getid();
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('users/$id').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<Object?, Object?>;
        var premium = data['prenium'].toString();
        bool a = (premium.toLowerCase() == 'true') ? true : false;
        return a;
      } else {
        return false;
      }
  }








  // void creatfavorite(String id, String userid) {
  //   var favorite = {"id" : id};
  //   var ref = FirebaseDatabase.instance.reference().child('favorite');
  //   ref.child(userid).set(favorite).then((_) {}).catchError((err) {});
  // }




}


