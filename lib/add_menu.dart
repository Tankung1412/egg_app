/*import 'package:flutter/material.dart';
import 'package:food_app/data.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final _formKey = GlobalKey<FormState>();
  
  String? menuName;
  String? rawMat;
  String? desCrip;
  String? sTar;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        title: const Text('เพิ่มเมนู'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('เพิ่มเมนู', style: TextStyle(fontSize: 30),),
              const SizedBox(height: 20,),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ช่องกรอกชื่อเมนู
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('ชื่อเมนู', style: TextStyle(fontSize: 16),)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกชื่อเมนู';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          menuName = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกวัตถุดิบ
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('วัตถุดิบ', style: TextStyle(fontSize: 16),)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกข้อมูลวัตถุดิบ';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          rawMat = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกวิธีการทำ
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('วิธีการทำ', style: TextStyle(fontSize: 16),)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกข้อมูลวิธีการทำ';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          desCrip = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกระดับความยาก (1-5)
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('ระดับความยาก (1-5)', style: TextStyle(fontSize: 16),)
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
                          sTar = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกชื่อไฟล์รูป
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('ชื่อไฟล์รูป (อยู่ในโฟลเดอร์ images)', style: TextStyle(fontSize: 16),)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกชื่อไฟล์รูป';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          image = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ปุ่ม "เพิ่ม" และ "ยกเลิก"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 158, 98, 76)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // เพิ่มข้อมูลเมนูใหม่ลงใน Data.lstMenu
                                Data.lstMenu.add({
                                  'menu_name': menuName,
                                  'raw_mat': rawMat,
                                  'descrip': desCrip,
                                  'star': int.parse(sTar!),
                                  'img': 'images/$image',
                                });
                                // แสดง dialog ยืนยันการเพิ่มเมนู
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('สำเร็จ'),
                                      content: const Text('เพิ่มเมนูเรียบร้อยแล้ว'),
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
                            child: const Text('เพิ่ม', style: TextStyle(color: Colors.white),)
                          ),
                          const SizedBox(width: 10,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                            onPressed: () => Navigator.pop(context), 
                            child: const Text('ยกเลิก', style: TextStyle(color: Colors.black),)     
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:food_app/data.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final _formKey = GlobalKey<FormState>();

  String? menuName;
  String? rawMat;
  String? desCrip;
  String? sTar;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        title: const Text('เพิ่มเมนู'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('เพิ่มเมนู', style: TextStyle(fontSize: 30),),
              const SizedBox(height: 20,),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ช่องกรอกชื่อเมนู
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('ชื่อเมนู', style: TextStyle(fontSize: 16),)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกชื่อเมนู';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          menuName = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกวัตถุดิบ
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('วัตถุดิบ', style: TextStyle(fontSize: 16),)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกข้อมูลวัตถุดิบ';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          rawMat = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกวิธีการทำ
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('วิธีการทำ', style: TextStyle(fontSize: 16),)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกข้อมูลวิธีการทำ';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          desCrip = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกระดับความยาก (1-5)
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('ระดับความยาก (1-5)', style: TextStyle(fontSize: 16),)
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
                          sTar = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกชื่อไฟล์รูป
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('ชื่อไฟล์รูป (อยู่ในโฟลเดอร์ images)', style: TextStyle(fontSize: 16),)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกชื่อไฟล์รูป';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          image = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ปุ่ม "เพิ่ม" และ "ยกเลิก"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 158, 98, 76)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // เพิ่มข้อมูลเมนูใหม่ลงใน Data.lstMenu พร้อมเพิ่มคีย์ "isUserAdded": true
                                Data.lstMenu.add({
                                  'menu_name': menuName,
                                  'raw_mat': rawMat,
                                  'descrip': desCrip,
                                  'star': int.parse(sTar!),
                                  'img': 'images/$image',
                                  'isUserAdded': true,
                                });
                                // แสดง dialog ยืนยันการเพิ่มเมนู
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('สำเร็จ'),
                                      content: const Text('เพิ่มเมนูเรียบร้อยแล้ว'),
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
                            child: const Text('เพิ่ม', style: TextStyle(color: Colors.white),)
                          ),
                          const SizedBox(width: 10,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                            onPressed: () => Navigator.pop(context), 
                            child: const Text('ยกเลิก', style: TextStyle(color: Colors.black),)     
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/data.dart';
import 'package:image_picker/image_picker.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final _formKey = GlobalKey<FormState>();
  String? menuName;
  String? rawMat;
  String? desCrip;
  String? sTar;
  XFile? _pickedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pickedImage = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        title: const Text('เพิ่มเมนู'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('เพิ่มเมนู', style: TextStyle(fontSize: 30),),
              const SizedBox(height: 20,),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // ช่องกรอกชื่อเมนู
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('ชื่อเมนู', style: TextStyle(fontSize: 16),),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกชื่อเมนู';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          menuName = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกวัตถุดิบ
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('วัตถุดิบ', style: TextStyle(fontSize: 16),),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกข้อมูลวัตถุดิบ';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          rawMat = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกวิธีการทำ
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('วิธีการทำ', style: TextStyle(fontSize: 16),),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกข้อมูลวิธีการทำ';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          desCrip = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ช่องกรอกระดับความยาก (1-5)
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('ระดับความยาก (1-5)', style: TextStyle(fontSize: 16),),
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
                          sTar = value;
                        },
                      ),
                      const SizedBox(height: 20,),
                      // ส่วนสำหรับอัปโหลดรูปภาพจริง
                      _pickedImage != null
                          ? Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Image.file(
                                File(_pickedImage!.path),
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Text('ยังไม่ได้เลือกรูปภาพ'),
                      const SizedBox(height: 10,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 158, 98, 76)),
                        onPressed: _pickImage,
                        child: const Text('เลือกรูปภาพ', style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(height: 20,),
                      // ปุ่ม "เพิ่ม" และ "ยกเลิก"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 158, 98, 76)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_pickedImage == null) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('แจ้งเตือน'),
                                        content: const Text('กรุณาเลือกรูปภาพ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('ตกลง'),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                                _formKey.currentState!.save();
                                // เพิ่มข้อมูลเมนูใหม่ลงใน Data.lstMenu
                                Data.lstMenu.add({
                                  'menu_name': menuName,
                                  'raw_mat': rawMat,
                                  'descrip': desCrip,
                                  'star': int.parse(sTar!),
                                  'img': _pickedImage!.path, // บันทึก path ของรูปภาพที่เลือก
                                });
                                // แสดง dialog ยืนยันการเพิ่มเมนู
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('สำเร็จ'),
                                      content: const Text('เพิ่มเมนูเรียบร้อยแล้ว'),
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
                            child: const Text('เพิ่ม', style: TextStyle(color: Colors.white),),
                          ),
                          const SizedBox(width: 10,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                            onPressed: () => Navigator.pop(context),
                            child: const Text('ยกเลิก', style: TextStyle(color: Colors.black),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//ใส่อันนี้ลงใน pubspec.yaml
//dependencies:
//  image_picker: ^0.8.6

 */

