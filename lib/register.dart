import 'package:flutter/material.dart';
import 'package:food_app/data.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // ตรวจสอบว่ากรอกข้อมูลครบหรือไม่
    if (username.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('แจ้งเตือน'),
            content: const Text('กรุณากรอกข้อมูลให้ครบ'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ตกลง'),
              ),
            ],
          );
        },
      );
      return;
    }

    // ตรวจสอบว่าชื่อผู้ใช้นี้มีอยู่แล้วหรือไม่
    bool exists =
        Data.lstUser.any((user) => user['username'] == username);
    if (exists) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('แจ้งเตือน'),
            content: const Text('ชื่อผู้ใช้มีอยู่แล้ว กรุณาใช้ชื่ออื่น'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ตกลง'),
              ),
            ],
          );
        },
      );
      return;
    }

    // บันทึกข้อมูลผู้ใช้ใหม่ลงใน lstUser
    Data.lstUser.add({'username': username, 'password': password});

    // แสดง dialog ยืนยันการลงทะเบียนสำเร็จ
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('สำเร็จ'),
          content: const Text('ลงทะเบียนสำเร็จ'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด dialog
                Navigator.pop(context); // กลับไปที่หน้า Login
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
        title: const Text('ลงทะเบียน'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image(
              image: AssetImage('images/Eggtopia_logo.png'),
              width: 350,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: const Text('ลงทะเบียน'),
            ),
          ],
        ),
      ),
    );
  }
}
