import 'package:flutter/material.dart';
import 'package:food_app/main_page.dart';
import 'package:food_app/mainpage.dart';
import 'package:food_app/data.dart';
import 'package:food_app/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
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
              )
            ],
          );
        },
      );
      return;
    }

    // ตรวจสอบข้อมูลใน lstUser
    bool isValid = Data.lstUser.any((user) =>
        user['username'] == username && user['password'] == password);

    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(username: username),
        ),
      );
    } else {
      // แสดง dialog แจ้งเตือนเมื่อข้อมูลไม่ถูกต้อง
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('แจ้งเตือน'),
            content: const Text('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง'),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 158, 98, 76),
          title: const Text('Login')),
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
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            // ปุ่มสำหรับลงทะเบียน
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: const Text('ลงทะเบียน'),
            ),
          ],
        ),
      ),
    );
  }
}
