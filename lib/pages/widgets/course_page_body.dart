import 'package:custom_animation_ui/pages/widgets/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../models/Course.dart';

class ReviewPageBody extends StatefulWidget {
  final Course course;
  DragUpdateDetails? dragUpdateDetails;
  ReviewPageBody({Key? key, required this.course, this.dragUpdateDetails}) : super(key: key);

  @override
  State<ReviewPageBody> createState() => _ReviewPageBodyState();
}

class _ReviewPageBodyState extends State<ReviewPageBody> {
  double rotation = 0.25;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.keepScrollOffset);
      print(_scrollController.offset);
      if (_scrollController.offset < -80) {
        crossFadeState = CrossFadeState.showFirst;
      }
      if (_scrollController.offset > 100) {
        crossFadeState = CrossFadeState.showSecond;
      }
      if (_scrollController.offset < -80) {
        rotation = 0.25;
      }
      if (_scrollController.offset > 100) {
        rotation = 0.75;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped');
      },
      onVerticalDragEnd: (DragEndDetails details) {
        widget.dragUpdateDetails = null;
      },
      onVerticalDragUpdate: (DragUpdateDetails dragDetails) {
        widget.dragUpdateDetails = dragDetails;
        crossFadeState = widget.dragUpdateDetails == null
            ? CrossFadeState.showFirst
            : (widget.dragUpdateDetails?.delta.dy)! < -4
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst;
        print(widget.dragUpdateDetails?.delta.dy);
        rotation = widget.dragUpdateDetails == null
            ? 0.25
            : (widget.dragUpdateDetails?.delta.dy)! < -4
                ? 0.75
                : 0.25;
        setState(() {});
      },
      child: Positioned(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 65),
              buildAppBar(),
              AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.only(
                    left: 30, right: 30, top: crossFadeState == CrossFadeState.showFirst ? 50 : 20, bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedScale(
                      scale: crossFadeState == CrossFadeState.showFirst ? 1 : 0.7,
                      duration: const Duration(milliseconds: 350),
                      alignment: Alignment.centerLeft,
                      child: myShowUp(
                        delay: 200,
                        direction: Direction.vertical,
                        child: Text(
                          (widget.course.name)!,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 26),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: crossFadeState == CrossFadeState.showFirst ? 5 : 0),
                    AnimatedScale(
                      scale: crossFadeState == CrossFadeState.showFirst ? 1 : 0.7,
                      duration: const Duration(milliseconds: 350),
                      alignment: Alignment.centerLeft,
                      child: myShowUp(
                        delay: 300,
                        direction: Direction.vertical,
                        child: Text(
                          (widget.course.category)!,
                          style: const TextStyle(color: Color(0xffbfc1cc), fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: crossFadeState == CrossFadeState.showFirst ? 25 : 5),
                    AnimatedScale(
                      scale: crossFadeState == CrossFadeState.showFirst ? 1 : 0.7,
                      duration: const Duration(milliseconds: 350),
                      alignment: Alignment.centerLeft,
                      child: myShowUp(
                        delay: 380,
                        direction: Direction.vertical,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildRateStarts(num.parse((widget.course.rate)!)),
                            Text(
                              (widget.course.rate)!,
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.group,
                                    color: Color(0xffFC9803),
                                  ),
                                  Text(
                                    ' ' + (widget.course.students)!,
                                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time_filled_rounded,
                                  color: Color(0xffFC9803),
                                ),
                                Text(
                                  ' ' + (widget.course.time)!,
                                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: crossFadeState == CrossFadeState.showFirst ? 23 : 0),
                    AnimatedCrossFade(
                      crossFadeState: crossFadeState,
                      duration: const Duration(milliseconds: 600),
                      firstCurve: Curves.slowMiddle,
                      secondCurve: Curves.fastOutSlowIn,
                      sizeCurve: Curves.easeInOutCirc,
                      secondChild: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                      ),
                      firstChild: myShowUp(
                        delay: 400,
                        direction: Direction.vertical,
                        child: Text(
                          widget.course.price!,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: crossFadeState == CrossFadeState.showFirst ? 23 : 0),
                    AnimatedCrossFade(
                      crossFadeState: crossFadeState,
                      duration: const Duration(milliseconds: 600),
                      firstCurve: Curves.slowMiddle,
                      secondCurve: Curves.fastOutSlowIn,
                      sizeCurve: Curves.easeInOutCirc,
                      secondChild: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.34,
                      ),
                      firstChild: myShowUp(
                        delay: 430,
                        direction: Direction.vertical,
                        child: const Text(
                          'About course',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: crossFadeState == CrossFadeState.showFirst ? 8 : 0),
                    AnimatedCrossFade(
                      crossFadeState: crossFadeState,
                      duration: const Duration(milliseconds: 600),
                      firstCurve: Curves.slowMiddle,
                      secondCurve: Curves.fastOutSlowIn,
                      sizeCurve: Curves.easeInOutCirc,
                      secondChild: SizedBox(
                        width: MediaQuery.of(context).size.width,
                      ),
                      firstChild: myShowUp(
                        delay: 500,
                        direction: Direction.vertical,
                        child: Text(
                          (widget.course.description)!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: crossFadeState == CrossFadeState.showFirst ? 12 : 0),
                    myShowUp(
                      delay: 630,
                      direction: Direction.vertical,
                      offset: -4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              rotation = rotation == 0.25 ? 0.75 : 0.25;
                              crossFadeState = crossFadeState == CrossFadeState.showSecond
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond;
                              setState(() {});
                            },
                            splashRadius: 25,
                            visualDensity: VisualDensity.comfortable,
                            icon: AnimatedRotation(
                              // quarterTurns: rotation,
                              alignment: Alignment.center,
                              filterQuality: FilterQuality.high,
                              curve: Curves.easeInOutCubic,
                              duration: const Duration(milliseconds: 800),
                              turns: rotation,
                              child: const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    myShowUp(
                      delay: 700,
                      direction: Direction.vertical,
                      offset: 4,
                      child: const Text(
                        'Reviews',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    myShowUp(
                      delay: 800,
                      direction: Direction.horizontal,
                      offset: 1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                        height: crossFadeState == CrossFadeState.showFirst ? 300 : 510,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: (widget.course.reviews
                                ?.map(
                                  (e) => ReviewWidget(
                                    review: e,
                                    image: 'assets/images/avatar${(widget.course.reviews?.indexOf(e))! + 1}.png',
                                  ),
                                )
                                .toList())!,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
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
              color: Colors.white,
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
                  color: index < rateInInt ? const Color(0xffFC9803) : const Color(0xffD1D4D6),
                ),
              )),
    );
  }
}
