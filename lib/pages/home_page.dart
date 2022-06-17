import 'package:custom_animation_ui/pages/widgets/home_page_body.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DragUpdateDetails? dragUpdateDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onVerticalDragEnd: (DragEndDetails details) {
        dragUpdateDetails = null;
      },
      onVerticalDragUpdate: (DragUpdateDetails dragDetails) {
        dragUpdateDetails = dragDetails;
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: const Color(0xffe1e1e8),
        body: SafeArea(
          child: Stack(
            children: [
              buildBackground(context, dragUpdateDetails),
              const MainBody(),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildBackground(BuildContext context, DragUpdateDetails? dragUpdateDetails) {
    return Positioned.fill(
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 3200),
            curve: Curves.elasticOut,
            top: (MediaQuery.of(context).size.height * 0.24) + ((dragUpdateDetails?.delta.dy ?? 0) * 20),
            left: 30,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffd8d8e1), Color(0xffbfc1cc)],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 3200),
            curve: Curves.elasticOut,
            top: (MediaQuery.of(context).size.height * 0.18) + ((dragUpdateDetails?.delta.dy ?? 0) * 5),
            left: MediaQuery.of(context).size.width * 0.65,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffd8d8e1), Color(0xffbfc1cc)],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 3200),
            curve: Curves.elasticOut,
            top: (MediaQuery.of(context).size.height * 0.4) + ((dragUpdateDetails?.delta.dy ?? 0) * 5),
            left: MediaQuery.of(context).size.width * 0.75,
            child: Container(
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffd8d8e1), Color(0xffbfc1cc)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
