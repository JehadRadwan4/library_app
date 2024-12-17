import 'package:final_project/book_rating.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/tow_side_rounded_button.dart';
import 'package:flutter/material.dart';

class ReadingListCard extends StatefulWidget {
  final String? image;
  final String? title;
  final String? auth;
  final double? rating;
  final Function? pressDetails;
  final Function? pressRead;

  ReadingListCard({
    this.image,
    this.title,
    this.auth,
    this.rating,
    this.pressDetails,
    this.pressRead,
  }) ;

  @override
  State<ReadingListCard> createState() => _ReadingListCardState();
}

class _ReadingListCardState extends State<ReadingListCard> {
  bool state = false; // Move state to the class level.

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40),
      height: 245,
      width: 202,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            widget.image!,
            width: 150,
          ),
          Positioned(
            top: 35,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: state ? Colors.red : Colors.grey, // Update color based on state.
                  ),
                  onPressed: () {
                    setState(() {
                      state = !state; // Toggle the state on button press.
                    });
                  },
                ),
                BookRating(score: widget.rating!),
              ],
            ),
          ),
          Positioned(
            top: 160,
            child: Container(
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: kBlackColor),
                        children: [
                          TextSpan(
                            text: "${widget.title}\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.auth,
                            style: TextStyle(
                              color: kLightBlackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.pressDetails!();
                        },
                        child: Container(
                          width: 101,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text("Details"),
                        ),
                      ),
                      Expanded(
                        child: TwoSideRoundedButton(
                          text: "Read",
                          press: widget.pressRead,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
