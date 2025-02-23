import 'package:flutter/material.dart';
import 'package:food_app/data.dart';
import 'package:food_app/category_detail.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    // ดึงข้อมูล star จาก Data.lstMenu แล้วแปลงเป็น List ของค่า star ที่ไม่ซ้ำกัน
    final List<int> starCategories = Data.lstMenu
        .map((menu) => menu['star'] as int)
        .toSet()
        .toList();
    starCategories.sort((a, b) => b.compareTo(a)); // เรียงจากมากไปน้อย (ถ้าต้องการ)

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        title: const Text('Category'),
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // 1 คอลัมน์
          childAspectRatio: 3, // ปรับอัตราส่วนให้เหมาะสม
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: starCategories.length,
        itemBuilder: (context, index) {
          int star = starCategories[index];
          return InkWell(
            onTap: () {
              // เมื่อกดที่ grid ให้ไปหน้า CategoryDetail พร้อมส่งค่า star ที่เลือก
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetail(star: star),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              child: Center(
                child: Text(
                  'เมนูระดับ $star ดาว',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
