import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/utils/styles.dart';
import 'package:module2_4_lab_exercise/widget/bigbutton.dart';
import 'package:module2_4_lab_exercise/widget/smallbutton.dart';

class ViewPage extends StatelessWidget with GlobalStyles {
  ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Bigbutton(
              text: 'BigButtom',
              color: GlobalStyles.blushPink,
              onPressed: () {}),
          const SizedBox(
            height: 15,
          ),
          Smallbutton(
              text: "SmallButton",
              color: GlobalStyles.deepRose,
              onPressed: () {}),
        ],
      ),
    );
  }
}
