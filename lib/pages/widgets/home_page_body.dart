import 'package:custom_animation_ui/models/Category.dart';
import 'package:custom_animation_ui/pages/category_page.dart';
import 'package:finite_coverflow/finite_coverflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/Course.dart';
import '../course_page.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    Key? key,
  }) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 3200),
      curve: Curves.elasticOut,
      left: 21,
      right: 21,
      top: 0,
      bottom: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          buildAppBar(),
          const SizedBox(height: 50),
          const Text(
            'Welcome back',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: Color(0xff16182D)),
          ),
          const Text(
            'John',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: Color(0xff16182D)),
          ),
          const SizedBox(height: 50),
          buildSearchInput(context),
          const SizedBox(height: 40),
          buildRowTitle('Categories'),
          const SizedBox(height: 15),
          Container(height: 150, child: buildSwiper()),
          const SizedBox(height: 10),
          buildRowTitle('Recomended'),
          const SizedBox(height: 15),
          Container(height: 130, child: buildSwiper2()),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  Expanded buildSwiper() {
    return Expanded(
      child: FinitePager(
        scaleX: 0.8,
        scaleY: 0.76,
        scrollDirection: Axis.horizontal,
        children: categories
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          image: "assets/images/${e.name}.jpg",
                          category: e,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: "${e.coursesCount!} ${categories.indexOf(e)}",
                          child: Container(
                            height: 80,
                            margin: const EdgeInsets.only(bottom: 3),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/${e.name}.jpg',
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.name!,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                e.coursesCount!,
                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Expanded buildSwiper2() {
    double _scale = 1;
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: courses.map(
          (e) {
            return GestureDetector(
              onTap: () {
                _scale = 0;
                setState(() {});
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CoursePage(
                              course: e,
                            )));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                width: 300,
                height: 56,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: const Color(0xff16182D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: _scale,
                  child: Stack(
                    children: [
                      Hero(
                        tag: '${e.students}/course',
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff16182D),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.name!,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              e.category!,
                              style:
                                  const TextStyle(color: Color(0xffbfc1cc), fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            const Expanded(child: SizedBox()),
                            Row(
                              children: [
                                buildRateStarts(num.parse(e.rate!)),
                                Text(
                                  e.rate!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  e.time!,
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget buildRateStarts(num rate) {
    int rateInInt = rate.round();
    return Row(
      children: List.generate(
          5,
          (index) => GestureDetector(
                onTap: () {
                  // _onChanged(index + 1);
                  rateInInt = index;
                  setState(() {});
                },
                child: Icon(
                  Icons.star,
                  color: index < rateInInt ? Color(0xffFC9803) : Color(0xffD1D4D6),
                ),
              )),
    );
  }

  Row buildRowTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff16182D),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          'View all',
          style: TextStyle(
            color: Color(0xff6a6c93),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Container buildSearchInput(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      padding: const EdgeInsets.only(left: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search courses',
          hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
          border: InputBorder.none,
          suffixIcon: Container(
            height: 40,
            width: 40,
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
      ),
    );
  }

  Row buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/ic_menu.svg'),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: const DecorationImage(image: AssetImage('assets/images/avatar.jpg'))),
        ),
      ],
    );
  }
}
