import 'package:flutter/material.dart';
import 'package:todo_list/Pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
