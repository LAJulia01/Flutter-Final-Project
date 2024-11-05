import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/userData.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class CharacteristicsInfo extends StatelessWidget {
  const CharacteristicsInfo({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              for (var i = 0;
                  i < userData.userAccount.characteristics.length;
                  i++)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: GlobalStyles.buttonColor,
                    ),
                    width: 30,
                    height: 35,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        userData.userAccount.characteristics[i],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: GlobalStyles.fontColor),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
