
import 'package:final_project/constant.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  final double score;
  const BookRating({
 
   required this.score,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        
      ),
      child: Column(
        children: [
          Icon(
            Icons.star,
            color: kIconColor,
            size: 15,
          ),
          SizedBox(height: 5),
          Text(
            "$score",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}