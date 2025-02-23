import 'package:flutter/material.dart';
import 'package:food_app/category.dart';
import 'package:food_app/home.dart';
import 'package:food_app/profile.dart';
import 'package:food_app/savemenu.dart';

class MainPage extends StatefulWidget {
  final String username;
  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _naviItemIndex = 0; // ลำดับของปุ่มที่เลือก
  late final List<Widget> pages; // ประกาศ list ของหน้าต่างๆ

  @override
  void initState() {
    super.initState();
    // กำหนดหน้าในแต่ละแท็บ โดยส่งค่า username ไปยังหน้า Profile
    pages = <Widget>[
      const Home(),
      const Category(),
      const SaveMenu(),
      Profile(username: widget.username),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_naviItemIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        fixedColor: const Color.fromARGB(255, 255, 193, 170),
        showSelectedLabels: true, // แสดงข้อความบนปุ่มที่ถูกเลือก
        showUnselectedLabels: true, // แสดงข้อความบนปุ่มที่ไม่ถูกเลือก
        currentIndex: _naviItemIndex,
        items: btnNavItem(),
        onTap: (index) {
          setState(() {
            _naviItemIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> btnNavItem() {
    var iconItem = [
      Icons.home,
      Icons.category_outlined,
      Icons.save_as_outlined,
      Icons.account_box_outlined
    ];
    var labelItem = ['หน้าหลัก', 'หมวดหมู่', 'ที่บันทึกไว้', 'โปรไฟล์'];
    var bgColorItem = [Colors.deepPurple, Colors.indigo, Colors.teal, Colors.brown];

    BottomNavigationBarItem createItem(int index) {
      return BottomNavigationBarItem(
        icon: Icon(iconItem[index]),
        label: labelItem[index],
        backgroundColor: bgColorItem[index],
      );
    }

    return List.generate(iconItem.length, createItem);
  }
}
