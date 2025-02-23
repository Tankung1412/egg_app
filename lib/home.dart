/*import 'package:flutter/material.dart';
import 'package:food_app/add_menu.dart';
import 'package:food_app/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        title: banner(),
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(child: myGrid()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMenu()),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
          color: Color.fromARGB(255, 255, 193, 170),
        ),
      ),
    );
  }

  Widget banner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/Eggtopia_logo.png', width: 50),
        const SizedBox(width: 5),
        const Text(
          'EGGTOPIA',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }

  Widget buildGridTile(BuildContext ctx, int index) {
    var menu = Data.lstMenu[index];
    var menuName = menu['menu_name'];
    var img = menu['img'];

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(ctx, '/m_dt', arguments: {
          'mn': menu['menu_name'],
          'rm': menu['raw_mat'],
          'dc': menu['descrip'],
          'st': menu['star'],
          'img': menu['img']
        });
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.5),
            child: Text(
              menuName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // ปุ่มสำหรับบันทึกเมนูที่ชอบ
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                Data.lstSavedMenu.any((saved) =>
                        saved['menu_name'] == menuName)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  bool alreadySaved = Data.lstSavedMenu.any((saved) =>
                      saved['menu_name'] == menuName);
                  if (!alreadySaved) {
                    Data.lstSavedMenu.add(menu);
                  } else {
                    // ถ้าต้องการ toggle การบันทึก ให้ลบออกเมื่อกดอีกครั้ง
                    Data.lstSavedMenu.removeWhere(
                        (saved) => saved['menu_name'] == menuName);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget myGrid() {
    var count = Data.lstMenu.length;
    return GridView.builder(
      itemCount: count,
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: buildGridTile(context, index),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:food_app/add_menu.dart';
import 'package:food_app/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredMenus = [];

  @override
  void initState() {
    super.initState();
    _filteredMenus = List.from(Data.lstMenu);
  }

  void _filterMenus(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredMenus = List.from(Data.lstMenu);
      });
    } else {
      setState(() {
        _filteredMenus = Data.lstMenu.where((menu) {
          String menuName = menu['menu_name'].toLowerCase();
          return menuName.contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  Widget banner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/Eggtopia_logo.png', width: 50),
        const SizedBox(width: 5),
        const Text('EGGTOPIA', style: TextStyle(fontSize: 20)),
      ],
    );
  }

  Widget buildGridTile(BuildContext ctx, int index) {
    var menu = _filteredMenus[index];
    var menuName = menu['menu_name'];
    var img = menu['img'];

    // ตรวจสอบว่ามีการบันทึกเมนูนี้แล้วหรือไม่
    bool isSaved = Data.lstSavedMenu.any((saved) => saved['menu_name'] == menuName);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(ctx, '/m_dt', arguments: {
          'mn': menu['menu_name'],
          'rm': menu['raw_mat'],
          'dc': menu['descrip'],
          'st': menu['star'],
          'img': menu['img'],
        });
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.5),
            child: Text(
              menuName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // ปุ่มไอคอนบันทึก (favorite)
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                isSaved ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  bool alreadySaved = Data.lstSavedMenu.any((saved) => saved['menu_name'] == menuName);
                  if (!alreadySaved) {
                    Data.lstSavedMenu.add(menu);
                  } else {
                    Data.lstSavedMenu.removeWhere((saved) => saved['menu_name'] == menuName);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget myGrid() {
    return GridView.builder(
      itemCount: _filteredMenus.length,
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: buildGridTile(context, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        title: banner(),
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
      ),
      body: Column(
        children: [
          // ช่องค้นหาด้านบนที่มีพื้นหลังสีขาว
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'ค้นหาเมนู...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: _filterMenus,
            ),
          ),
          // แสดง Grid ของเมนู
          Expanded(child: myGrid()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMenu()),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
          color: Color.fromARGB(255, 255, 193, 170),
        ),
      ),
    );
  }
}


