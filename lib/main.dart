import 'package:demo/pages/categoriesPage.dart';
import 'package:demo/pages/login_page.dart';
import 'package:demo/pages/trending.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const LoginPage(),
        "allProductList": (context) => const CategoriesPage(),
      },
    );
  }
}

