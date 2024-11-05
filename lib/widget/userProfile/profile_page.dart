import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/userData.dart';
import 'package:module2_4_lab_exercise/styles.dart';
import 'package:module2_4_lab_exercise/widget/userProfile/CharacteristicInfo.dart';
import 'package:module2_4_lab_exercise/widget/userProfile/ReviewsInfo.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.userData});

  final UserData userData;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget titleText(final text) => Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: GlobalStyles.textStyle(
              25,
              Colors.black,
              FontWeight.bold,
            ),
          ),
        );

    return Container(
      margin: GlobalStyles.paddingStyle(25, 10),
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
                      color: GlobalStyles.starColor,
                      size: 20,
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '•',
                    style: GlobalStyles.textStyle(
                      20,
                      GlobalStyles.fontColor,
                      FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${userData.userAccount.numofReviews} Reviews',
                    style: GlobalStyles.textStyle(
                      15,
                      GlobalStyles.fontColor,
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: GlobalStyles.fontColor,
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
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          titleText('Characteristics'),
          CharacteristicsInfo(
            userData: userData,
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
          titleText('Availability'),
          //Code Here Availability
        ],
      ),
    );
  }
}
