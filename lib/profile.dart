/*import 'package:flutter/material.dart';
import 'package:food_app/data.dart';
import 'package:food_app/login.dart';

class Profile extends StatefulWidget {
  final String username;
  const Profile({super.key, required this.username});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        title: const Text('โปรไฟล์'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ข้อความต้อนรับ
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, ${widget.username}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 158, 98, 76),
          ),
          // ส่วนแสดงเมนูที่บันทึกไว้ในรูปแบบ Grid
          Expanded(
            child: Data.lstSavedMenu.isEmpty
                ? const Center(
                    child: Text(
                      'ไม่มีเมนูที่บันทึกไว้',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: Data.lstSavedMenu.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        final menu = Data.lstSavedMenu[index];
                        return GestureDetector(
                          // เมื่อกดที่ tile (นอกปุ่มเลิกบันทึก) ให้ไปแสดงหน้า MenuDetail
                          onTap: () {
                            Navigator.pushNamed(context, '/m_dt', arguments: {
                              'mn': menu['menu_name'],
                              'rm': menu['raw_mat'],
                              'dc': menu['descrip'],
                              'st': menu['star'],
                              'img': menu['img'],
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children: [
                                // แสดงรูปภาพ (สมมติว่าเป็น asset หากเป็น file ให้ใช้ Image.file)
                                Image.asset(
                                  menu['img'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  color: Colors.black.withOpacity(0.5),
                                  child: Text(
                                    menu['menu_name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                // ปุ่มสำหรับเลิกบันทึก (unsave)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Data.lstSavedMenu.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ออกจากระบบ'),
          content: const Text('คุณต้องการออกจากระบบหรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด dialog เมื่อกด "ไม่"
              },
              child: const Text('ไม่'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('ใช่'),
            ),
          ],
        );
      },
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:food_app/data.dart';
import 'package:food_app/login.dart';

class Profile extends StatefulWidget {
  final String username;
  const Profile({super.key, required this.username});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // กรองเมนูเฉพาะที่ผู้ใช้เพิ่ม (โดยตรวจสอบ key "isUserAdded")
    final List<Map<String, dynamic>> userAddedMenus = Data.lstMenu.where((menu) {
      return menu.containsKey('isUserAdded') && menu['isUserAdded'] == true;
    }).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        title: const Text('โปรไฟล์'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ข้อความต้อนรับ
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, ${widget.username}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 158, 98, 76),
          ),
          // แสดงเมนูที่ผู้ใช้เพิ่มไว้ (จากปุ่มเพิ่มในหน้า Home)
          Expanded(
            child: userAddedMenus.isEmpty
                ? const Center(
                    child: Text(
                      'ไม่มีเมนูที่เพิ่มไว้',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: userAddedMenus.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        final menu = userAddedMenus[index];
                        return GestureDetector(
                          // เมื่อกดที่ tile (นอกปุ่มเลิกบันทึก) ให้ไปแสดงหน้า Detail Menu
                          onTap: () {
                            Navigator.pushNamed(context, '/m_dt', arguments: {
                              'mn': menu['menu_name'],
                              'rm': menu['raw_mat'],
                              'dc': menu['descrip'],
                              'st': menu['star'],
                              'img': menu['img'],
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children: [
                                Image.asset(
                                  menu['img'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  color: Colors.black.withOpacity(0.5),
                                  child: Text(
                                    menu['menu_name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                // ปุ่มสำหรับเลิกบันทึก (ลบออกจากรายการเมนูที่เพิ่ม)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        // ลบออกจาก Data.lstMenu เมื่อเมนูเป็นของผู้ใช้เพิ่ม
                                        Data.lstMenu.removeWhere((m) =>
                                            m.containsKey('isUserAdded') &&
                                            m['isUserAdded'] == true &&
                                            m['menu_name'] == menu['menu_name']);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ออกจากระบบ'),
          content: const Text('คุณต้องการออกจากระบบหรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด dialog เมื่อกด "ไม่"
              },
              child: const Text('ไม่'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('ใช่'),
            ),
          ],
        );
      },
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:food_app/data.dart';
import 'package:food_app/edit_menu.dart';
import 'package:food_app/login.dart';

class Profile extends StatefulWidget {
  final String username;
  const Profile({super.key, required this.username});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // กรองเฉพาะเมนูที่ถูกเพิ่มโดยผู้ใช้ (มีคีย์ "isUserAdded": true)
    final List<Map<String, dynamic>> userAddedMenus = Data.lstMenu.where((menu) {
      return menu.containsKey('isUserAdded') && menu['isUserAdded'] == true;
    }).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        title: const Text('โปรไฟล์'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ข้อความต้อนรับ
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, ${widget.username}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 158, 98, 76),
          ),
          // แสดงเมนูที่ผู้ใช้เพิ่มไว้ในรูปแบบ Grid
          Expanded(
            child: userAddedMenus.isEmpty
                ? const Center(
                    child: Text(
                      'ไม่มีเมนูที่เพิ่มไว้',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: userAddedMenus.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        final menu = userAddedMenus[index];
                        final menuName = menu['menu_name'];
                        final img = menu['img'];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/m_dt', arguments: {
                              'mn': menu['menu_name'],
                              'rm': menu['raw_mat'],
                              'dc': menu['descrip'],
                              'st': menu['star'],
                              'img': menu['img'],
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children: [
                                Image.asset(
                                  img,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
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
                                // ปุ่มแก้ไข (edit) อยู่ที่มุมซ้ายบน
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditMenu(menu: menu),
                                        ),
                                      ).then((_) {
                                        setState(() {}); // refresh เมื่อกลับมาจากหน้าแก้ไข
                                      });
                                    },
                                  ),
                                ),
                                // ปุ่มลบ (delete) อยู่ที่มุมขวาบน
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Data.lstMenu.removeWhere((m) =>
                                            m.containsKey('isUserAdded') &&
                                            m['isUserAdded'] == true &&
                                            m['menu_name'] == menuName);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ออกจากระบบ'),
          content: const Text('คุณต้องการออกจากระบบหรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด dialog เมื่อกด "ไม่"
              },
              child: const Text('ไม่'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('ใช่'),
            ),
          ],
        );
      },
    );
  }
}
