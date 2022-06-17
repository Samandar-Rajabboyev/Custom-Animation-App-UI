import 'package:custom_animation_ui/pages/course_page.dart';
import 'package:custom_animation_ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HomePage.id: (ctx) => const HomePage(),
        CoursePage.id: (ctx) => CoursePage(),
      },
    );
  }
}
