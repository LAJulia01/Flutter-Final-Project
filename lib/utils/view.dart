import 'package:flutter/material.dart';
import 'package:final_project/utils/styles.dart';
import 'package:final_project/widget/bigbutton.dart';
import 'package:final_project/widget/smallbutton.dart';

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
