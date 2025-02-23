import 'package:flutter/material.dart';
import 'package:food_app/login.dart';
import 'package:food_app/main_page.dart';
import 'package:food_app/mainpage.dart';
import 'package:food_app/detail_menu.dart';
import 'package:food_app/home.dart';
import 'package:food_app/category.dart';
import 'package:food_app/save_menu.dart';
import 'package:food_app/register.dart';
import 'package:food_app/savemenu.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/main': (context) => MainPage(username: '',),
        '/m_dt': (context) => const DetailMenu(),
        '/home': (context) => const Home(),
        '/cat': (context) => Category(),
        '/info': (context) => SaveMenu(),
        '/reg': (context) => Register(),
        '/log': (context) => const Login(),
      },
    );
  }
}
