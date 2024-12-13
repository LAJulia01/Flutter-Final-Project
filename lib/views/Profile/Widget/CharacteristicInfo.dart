import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/model/user.dart';


import '../styles.dart';

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
                  i < userData.description.length;
                  i++)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Styles.buttonColor,
                    ),
                    width: 30,
                    height: 35,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        userData.description[i],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Styles.fontColor),
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
