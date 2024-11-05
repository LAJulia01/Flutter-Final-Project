import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/userReviews.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class ReviewsInfo extends StatelessWidget {
  const ReviewsInfo(
      {super.key, required this.width, required this.userReviews});

  final dynamic width;
  final UserReviews userReviews;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: GlobalStyles.reiewsColor,
      ),
      padding: GlobalStyles.paddingStyle(30, 25),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(userReviews.reviewerImg),
                radius: 180 / 6,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${userReviews.reviewerName}',
                    style: GlobalStyles.textStyle(
                      25,
                      Colors.white,
                      FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      for (var i = 0; i < 5; i++)
                        const Icon(
                          Icons.star,
                          color: GlobalStyles.starColor,
                          size: 20,
                        ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          Text(
            userReviews.reviewerContent,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              userReviews.reviewerTime,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFF1F6)),
            ),
          ),
        ],
      ),
    );
  }
}
