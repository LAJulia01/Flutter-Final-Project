import 'package:flutter/material.dart';
import 'package:nannycare/views/Profile/Widget/ReviewsInfo.dart';
import 'package:nannycare/views/review/Review_Page.dart';

import '../Model/userData.dart';
import '../styles.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.userData});

  final UserData userData;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget titleText(final text) => Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Styles.textStyle(
                25,
                Colors.black,
                FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewPage()));
              },
              child: Text(
                'See All',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'poppins',
                ),
              ),
            ),
          ],
        ));

    return Container(
      margin: Styles.paddingStyle(25, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  for (var i = 0; i < 5; i++)
                    const Icon(
                      Icons.star,
                      color: Styles.starColor,
                      size: 20,
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '•',
                    style: Styles.textStyle(
                      20,
                      Styles.fontColor,
                      FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${userData.userAccount.numofReviews} Reviews',
                    style: Styles.textStyle(
                      15,
                      Styles.fontColor,
                      FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'P ${userData.userAccount.hourlyRate}.00/hr',
                    style: const TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Styles.fontColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            userData.userAccount.description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontFamily: 'poppins',
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          titleText('Reviews'),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: userData.reviewersList.map((userReviews) {
                return ReviewsInfo(
                  userReviews: userReviews,
                  width: width,
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // titleText('Availability'),
          //Code Here Availability
        ],
      ),
    );
  }
}
