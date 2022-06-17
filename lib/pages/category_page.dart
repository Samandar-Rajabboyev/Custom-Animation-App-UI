import 'package:custom_animation_ui/models/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../models/Course.dart';

class CategoryPage extends StatefulWidget {
  final String image;
  final Category category;
  const CategoryPage({Key? key, required this.image, required this.category}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  ScrollController scrollController = ScrollController();
  List<String> skills = ['Javascript', "React", "Angular", "Jequery", "Webpack", "Python"];

  int imageCardState = 1;

  @override
  initState() {
    super.initState();
    scrollController.addListener(() {
      print(scrollController.keepScrollOffset);
      print(scrollController.offset);
      if (scrollController.offset < -80) {
        imageCardState = 1;
      }
      if (scrollController.offset > 100) {
        imageCardState = 0;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe1e1e8),
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(),
            const SizedBox(height: 30),
            buildImage(context),
            const SizedBox(height: 30),
            buildSkills(),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.category.courses?.length,
                itemBuilder: (ctx, index) {
                  return myShowUp(
                      delay: 800 * (index + 1),
                      direction: Direction.vertical,
                      offset: 0.2,
                      child: buildCourseCard(c: (widget.category.courses?[index])!));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCourseCard({required Course c}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            c.name!,
            style: const TextStyle(
              color: Color(0xff16182D),
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            c.lectures!,
            style: const TextStyle(
              color: Color(0xffEE7171),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.access_time_filled_rounded,
                    color: Color(0xff9a9fb9),
                    size: 18,
                  ),
                  Text(
                    ' ' + (c.time)!,
                    style: const TextStyle(color: Color(0xff9a9fb9), fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xff9a9fb9),
                    size: 18,
                  ),
                  Text(
                    (c.rate)!,
                    style: const TextStyle(color: Color(0xff9a9fb9), fontSize: 16),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.group,
                    color: Color(0xff9a9fb9),
                    size: 18,
                  ),
                  Text(
                    ' ' + (c.students)!,
                    style: const TextStyle(color: Color(0xff9a9fb9), fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSkills() {
    return Container(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            myShowUp(
              delay: 100,
              direction: Direction.vertical,
              offset: 0.2,
              child: Container(
                height: 45,
                width: 45,
                padding: const EdgeInsets.all(9),
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xff16182D),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: SvgPicture.asset(
                  'assets/images/ic_filter.svg',
                  width: 15,
                  height: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  ...(skills.map(
                    (e) {
                      return myShowUp(
                        delay: 200 * (skills.indexOf(e) + 2),
                        direction: Direction.vertical,
                        offset: 2,
                        child: Container(
                          height: 44,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            e,
                            style: const TextStyle(color: Color(0xff16182D), fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    },
                  ).toList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Hero buildImage(BuildContext context) {
    return Hero(
      tag: "${widget.category.coursesCount!} ${categories.indexOf(widget.category)}",
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width,
        height: imageCardState == 1 ? 260 : 90,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: imageCardState == 0
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 13,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 9,
                      offset: const Offset(0, 10)),
                ],
              )
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 13,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 9,
                      offset: const Offset(0, 10)),
                ],
              ),
        child: myShowUp(
          delay: 0,
          direction: Direction.vertical,
          offset: 0.2,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 26),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(imageCardState == 0 ? .8 : .6),
                    Colors.black.withOpacity(imageCardState == 0 ? .8 : .2),
                    imageCardState == 0 ? Colors.black.withOpacity(.8) : Colors.transparent,
                  ],
                ),
              ),
              child: Text(
                widget.category.name!,
                style: const TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myShowUp({double? offset, required int delay, required Widget child, required Direction direction}) {
    return ShowUpAnimation(
      delayStart: Duration(milliseconds: delay),
      animationDuration: const Duration(milliseconds: 700),
      curve: Curves.fastOutSlowIn,
      direction: direction,
      offset: offset ?? 2,
      child: child,
    );
  }

  Widget buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xff16182D),
              size: 35,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: const DecorationImage(image: AssetImage('assets/images/avatar.jpg'))),
          ),
        ],
      ),
    );
  }
}
