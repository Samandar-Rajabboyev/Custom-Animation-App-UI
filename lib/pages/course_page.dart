import 'package:custom_animation_ui/pages/widgets/course_page_body.dart';
import 'package:flutter/material.dart';

import '../models/Course.dart';

class CoursePage extends StatefulWidget {
  static const String id = 'course_page';
  Course? course;
  CoursePage({Key? key, this.course}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> with TickerProviderStateMixin {
  DragUpdateDetails? dragUpdateDetails;
  late AnimationController _animationControllerC1;
  late AnimationController _animationControllerC2;
  late AnimationController _animationControllerC3;
  late Animation animateCircle1;
  late Animation animateCircle2;
  late Animation animateCircle3;

  @override
  initState() {
    super.initState();
    animateFirstCircle();
    animateSecondCircle();
    animateThirdCircle();
  }

  animateFirstCircle() {
    _animationControllerC1 = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    animateCircle1 = Tween(
      begin: 640.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _animationControllerC1, curve: Curves.elasticInOut));
    _animationControllerC1.forward();
    _animationControllerC1.addListener(() {
      setState(() {});
    });
  }

  animateSecondCircle() {
    _animationControllerC2 = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    animateCircle2 = Tween(
      begin: 790.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _animationControllerC2, curve: Curves.elasticOut));
    Future.delayed(Duration(milliseconds: 400));
    _animationControllerC2.forward();
    _animationControllerC2.addListener(() {
      setState(() {});
    });
  }

  animateThirdCircle() {
    _animationControllerC3 = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    animateCircle3 = Tween(
      begin: 560.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _animationControllerC3, curve: Curves.elasticOut));

    _animationControllerC3.forward();
    _animationControllerC3.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('clicked');
      },
      onVerticalDragEnd: (DragEndDetails details) {
        dragUpdateDetails = null;
      },
      onVerticalDragUpdate: (DragUpdateDetails dragDetails) {
        dragUpdateDetails = dragDetails;
        setState(() {});
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: '${widget.course?.students}/course',
                child: Container(
                  color: const Color(0xff16182D),
                ),
              ),
            ),
            buildBackground(context, dragUpdateDetails),
            GestureDetector(
                onTap: () {
                  print('tapped');
                },
                onVerticalDragEnd: (DragEndDetails details) {
                  dragUpdateDetails = null;
                },
                onVerticalDragUpdate: (DragUpdateDetails dragDetails) {
                  dragUpdateDetails = dragDetails;
                  setState(() {});
                },
                child: ReviewPageBody(
                  course: widget.course!,
                  dragUpdateDetails: dragUpdateDetails,
                )),
          ],
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
            curve: Curves.fastLinearToSlowEaseIn,
            top: (MediaQuery.of(context).size.height * 0.24) +
                ((dragUpdateDetails?.delta.dy ?? 0) * 5) +
                animateCircle1.value,
            left: 30,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff383b50), Color(0xff2d2d42)],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 3200),
            curve: Curves.fastLinearToSlowEaseIn,
            top: (MediaQuery.of(context).size.height * 0.18) +
                ((dragUpdateDetails?.delta.dy ?? 0) * 20) +
                animateCircle2.value,
            left: MediaQuery.of(context).size.width * 0.65,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff383b50), Color(0xff2d2d42)],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 3200),
            curve: Curves.fastLinearToSlowEaseIn,
            top: (MediaQuery.of(context).size.height * 0.4) +
                ((dragUpdateDetails?.delta.dy ?? 0) * 15) +
                animateCircle3.value,
            left: MediaQuery.of(context).size.width * 0.75,
            child: Container(
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff383b50), Color(0xff2d2d42)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
