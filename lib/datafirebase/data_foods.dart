import 'dart:math';
import 'package:app_todays_food/Models/Typef.dart';
import 'package:app_todays_food/Models/foods.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class data_foods {
  Future<List<Typef>> getlist() async {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('typef');
    Completer<List<Typef>> completer = Completer<List<Typef>>();

    starCountRef.onValue.listen((DatabaseEvent event) async {
      final data = await event.snapshot.value;
      if (data != null && data is List) {
        List<Typef> items = [];
        for (var itemData in data) {
          if (itemData is Map<Object?, Object?>) {
            var id = itemData['id'].toString();
            var name = itemData['name'];
            var image = itemData['image'];
            items.add(Typef(
              id: int.parse(id),
              name: name.toString(),
              image: image.toString(),
            ));
          }
        }
        completer.complete(items); // Đánh dấu hoàn thành và trả về danh sách
      } else {
        completer.complete(
            []); // Trả về danh sách trống nếu không có dữ liệu hoặc không phải là danh sách
      }
    });

    return completer.future;
  }

  Future<List<foods>> getlistfoods() async {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('foods');
    Completer<List<foods>> completer = Completer<List<foods>>();

    starCountRef.onValue.listen((DatabaseEvent event) async {
      final data = await event.snapshot.value;
      if (data != null && data is List) {
        List<foods> items = [];
        for (var itemData in data) {
          if (itemData is Map<Object?, Object?>) {
            var id = itemData['id'].toString();
            var name = itemData['name'];
            var image = itemData['image'];
            var ingredient_count = itemData['ingredient_count'].toString();
            var step_count = itemData['step_count'].toString();
            var meals = itemData['meal'];
            var typef = itemData['typef'];
            var premium = itemData['premium'].toString();
            bool a = (premium.toLowerCase() == 'true') ? true : false;
            items.add(foods(
                id: int.parse(id),
                name: name.toString(),
                image: image.toString(),
                ingredient_count: int.parse(ingredient_count),
                step_count: int.parse(step_count),
                meals: meals.toString(),
                typef: typef.toString(),
                premium: a));
          }
        }
        completer.complete(items); // Đánh dấu hoàn thành và trả về danh sách
      } else {
        completer.complete(
            []); // Trả về danh sách trống nếu không có dữ liệu hoặc không phải là danh sách
      }
    });

    return completer.future;
  }

  List<foods> getlisttitle(List<foods> a, String title) {
    List<foods> list = [];
    for (var item in a) {
      if (item.typef == title || item.meals == title) {
        list.add(item);
      }
    }
    return list;
  }

  List<foods> getlistfavorite(List<foods> a, int id) {
    List<foods> list = [];
    for (var item in a) {
      if (item.id == id) {
        list.add(item);
      }
    }
    return list;
  }

  List<foods> getdetail(List<foods> a, int id) {
    List<foods> list = [];
    for (var item in a) {
      if (item.id == id) {
        list.add(item);
      }
    }
    return list;
  }

  Future<List<foods>> getlistrandom() async {
    int randomNumber = Random().nextInt(2 - 1 + 1) + 1;
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('foods/$randomNumber').get();
    if (snapshot.exists) {
      final data = snapshot.value as Map<Object?, Object?>;
      var id = data['id'].toString();
      var name = data['name'];
      var image = data['image'];
      var ingredient_count = data['ingredient_count'].toString();
      var step_count = data['step_count'].toString();
      var meals = data['meal'];
      var typef = data['typef'];
      var premium = data['premium'].toString();
      bool a = (premium.toLowerCase() == 'true') ? true : false;
      List<foods> items = [];
      items.add(foods(
          id: int.parse(id),
          name: name.toString(),
          image: image.toString(),
          ingredient_count: int.parse(ingredient_count),
          step_count: int.parse(step_count),
          meals: meals.toString(),
          typef: typef.toString(),
          premium: a));
      return items; // Trả về danh sách items
    } else {
      print('No data available.');
      return []; // Trả về danh sách rỗng nếu không có dữ liệu
    }
  }

  Future<List<String>> getListFromRealtimeDatabase(String a, String id) async {
    final DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child('$a/$id');

    try {
      DataSnapshot dataSnapshot = (await databaseReference.once()).snapshot;
      if (dataSnapshot.value != null) {
        if (dataSnapshot.value is List<dynamic>) {
          List<dynamic> data = dataSnapshot.value as List<dynamic>;
          List<String> stringList = data.cast<String>().toList();
          print(data);
          return stringList;
        } else if (dataSnapshot.value is Map<dynamic, dynamic>) {
          // Nếu dữ liệu là một Map, bạn cần xác định cách trích xuất danh sách chuỗi từ Map này.
          // Ví dụ: List<String> stringList = extractListFromMap(dataSnapshot.value);
          // return stringList;
        }
      }
      return [];
    } catch (error) {
      print('Lỗi khi lấy danh sách chuỗi: $error');
      return [];
    }
  }

  // void addNoteList() {
  //   List<String> myNotes = ['Note 1', 'Note 2', 'Note 3'];
  //   final DatabaseReference databaseReference =
  //   FirebaseDatabase.instance.reference().child('notes'); // Thay 'notes' bằng tên nút bạn muốn lưu danh sách chuỗi.
  //
  //   // Ghi danh sách chuỗi vào Realtime Database.
  //   databaseReference.set(myNotes).then((_) {
  //     print('Đã thêm danh sách chuỗi thành công.');
  //   }).catchError((error) {
  //     print('Lỗi khi thêm danh sách chuỗi: $error');
  //   });
  // }

  List<int> createNumberList(int n) {
    List<int> numberList = [];
    for (int i = 1; i <= n; i++) {
      numberList.add(i);
    }
    return numberList;
  }

  bool seticon(String id, List<String> list) {
    for (var item in list) {
      if (id == item) {
        return true;
      }
    }

    return false;
  }


  Future<void> addListFavorite(String userID, String id) async {
    int length = 0;
    List<String> stringList = [];
    final DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child('favorite/$userID');

    try {
      DataSnapshot dataSnapshot = (await databaseReference.once()).snapshot;
      if (dataSnapshot.value != null) {
        if (dataSnapshot.value is List<dynamic>) {
          List<dynamic> data = dataSnapshot.value as List<dynamic>;
          stringList = data.cast<String>().toList();
          print(data);
          length = stringList.length;
          print('length$length');
        }
      }
    } catch (error) {
      print('Lỗi khi lấy danh sách chuỗi: $error');
    }

    // Tiếp tục thêm 'id' vào danh sách favorite/$userID
    int a = 3;
    stringList.add(id);
    String lengtha = length.toString();
    var refa = FirebaseDatabase.instance.reference().child('favorite');
    refa.child(userID).set(stringList).then((_) {}).catchError((err) {});
  }

  Future<void> removeListFavorite(String userID, String id) async {
    int length = 0;
    List<String> stringList = [];
    final DatabaseReference databaseReference =
    FirebaseDatabase.instance.reference().child('favorite/$userID');

    try {
      DataSnapshot dataSnapshot = (await databaseReference.once()).snapshot;
      if (dataSnapshot.value != null) {
        if (dataSnapshot.value is List<dynamic>) {
          List<dynamic> data = dataSnapshot.value as List<dynamic>;
          stringList = data.cast<String>().toList();
          print(data);
          length = stringList.length;
          print('length$length');
        }
      }
    } catch (error) {
      print('Lỗi khi lấy danh sách chuỗi: $error');
    }

    stringList.remove(id);
    var ref = FirebaseDatabase.instance.reference().child('favorite');
    ref.child(userID).set(stringList).then((_) {
      print("Xóa phần tử thành công khỏi danh sách.");
    }).catchError((error) {
      print("Lỗi khi xóa phần tử khỏi danh sách: $error");
    });
  }
}
