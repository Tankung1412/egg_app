import 'package:flutter/material.dart';
import 'package:food_app/data.dart';

class EditMenu extends StatefulWidget {
  final Map<String, dynamic> menu;
  const EditMenu({super.key, required this.menu});

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  final _formKey = GlobalKey<FormState>();
  late String menuName;
  late String rawMat;
  late String desCrip;
  late String sTar;
  late String image;

  @override
  void initState() {
    super.initState();
    // Pre-fill fields with existing menu data
    menuName = widget.menu['menu_name'];
    rawMat = widget.menu['raw_mat'];
    desCrip = widget.menu['descrip'];
    sTar = widget.menu['star'].toString();
    image = widget.menu['img']; // เช่น "images/xxx.jpg"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        title: const Text('แก้ไขเมนู'),
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ชื่อเมนู
              TextFormField(
                initialValue: menuName,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'ชื่อเมนู',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกชื่อเมนู';
                  }
                  return null;
                },
                onSaved: (value) {
                  menuName = value!;
                },
              ),
              const SizedBox(height: 20),
              // วัตถุดิบ
              TextFormField(
                initialValue: rawMat,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'วัตถุดิบ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกวัตถุดิบ';
                  }
                  return null;
                },
                onSaved: (value) {
                  rawMat = value!;
                },
              ),
              const SizedBox(height: 20),
              // วิธีการทำ
              TextFormField(
                initialValue: desCrip,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'วิธีการทำ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกวิธีการทำ';
                  }
                  return null;
                },
                onSaved: (value) {
                  desCrip = value!;
                },
              ),
              const SizedBox(height: 20),
              // ระดับความยาก
              TextFormField(
                initialValue: sTar,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'ระดับความยาก (1-5)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกระดับความยาก';
                  }
                  int? star = int.tryParse(value);
                  if (star == null || star < 1 || star > 5) {
                    return 'กรุณากรอกตัวเลขระหว่าง 1 ถึง 5';
                  }
                  return null;
                },
                onSaved: (value) {
                  sTar = value!;
                },
              ),
              const SizedBox(height: 20),
              // ชื่อไฟล์รูป
              TextFormField(
                initialValue: image,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'ชื่อไฟล์รูป (อยู่ในโฟลเดอร์ images)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกชื่อไฟล์รูป';
                  }
                  return null;
                },
                onSaved: (value) {
                  image = value!;
                },
              ),
              const SizedBox(height: 20),
              // ปุ่มบันทึกและยกเลิก
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 158, 98, 76),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // ค้นหาตำแหน่งของเมนูเดิมใน Data.lstMenu โดยใช้ตัวระบุ (เช่น menu_name)
                        int index = Data.lstMenu.indexWhere(
                            (m) => m['menu_name'] == widget.menu['menu_name']);
                        if (index != -1) {
                          Data.lstMenu[index] = {
                            'menu_name': menuName,
                            'raw_mat': rawMat,
                            'descrip': desCrip,
                            'star': int.parse(sTar),
                            'img': image.startsWith('images/') ? image : 'images/$image',
                            'isUserAdded': true,
                          };
                        }
                        // แสดง Dialog ยืนยันการบันทึก
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('สำเร็จ'),
                              content: const Text('แก้ไขเมนูเรียบร้อยแล้ว'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // ปิด dialog
                                    Navigator.pop(context); // ย้อนกลับไปหน้าก่อนหน้า
                                  },
                                  child: const Text('ตกลง'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      'บันทึก',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // ยกเลิกการแก้ไขและกลับไปหน้าก่อนหน้า
                    },
                    child: const Text(
                      'ยกเลิก',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
