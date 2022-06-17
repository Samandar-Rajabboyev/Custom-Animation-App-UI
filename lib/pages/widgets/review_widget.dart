import 'package:custom_animation_ui/models/Review.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {
  final Review review;
  final String image;
  const ReviewWidget({Key? key, required this.review, required this.image}) : super(key: key);

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 4),
      width: MediaQuery.of(context).size.width,
      // height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(widget.image),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.review.fullname!,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  widget.review.date!,
                  style: const TextStyle(color: Color(0xffbfc1cc), fontSize: 15),
                ),
              ],
            ),
            subtitle: buildRateStarts(5),
            // trailing:
          ),
          Text(
            widget.review.description!,
            style: const TextStyle(
              color: Color(0xff898faf),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
              height: 1.3,
            ),
          )
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
                  color: index < rateInInt ? Color(0xffFC9803) : Color(0xffD1D4D6),
                ),
              )),
    );
  }
}
