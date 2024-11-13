import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles.dart';
import 'package:nannycare/widget/bigbutton.dart';
import 'package:nannycare/widget/smallbutton.dart';

class ViewPage extends StatelessWidget with GlobalStyles {
  const ViewPage({super.key});

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
