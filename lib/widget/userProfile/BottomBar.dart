import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

Widget bottomButtons(final flex, final child, Color backgroundColor) =>
    Expanded(
      flex: flex,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: backgroundColor,
            iconColor: GlobalStyles.iconColor,
            minimumSize: const Size.fromHeight(50)),
        onPressed: () {},
        child: child,
      ),
    );

class _BottomBarState extends State<BottomBar> with GlobalStyles {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: GlobalStyles.paddingStyle(20, 10),
      child: Row(
        children: [
          // bottomButtons(
          //     1,
          //     const Icon(
          //       Icons.favorite,
          //       size: 24,
          //     ),
          //     GlobalStyles.buttonColor),
          // const SizedBox(
          //   width: 15,
          // ),
          bottomButtons(
            5,
            Text(
              "Contact Me",
              style:
                  GlobalStyles.textStyle(18, Colors.white, FontWeight.normal),
            ),
            const Color(0xFFF5A7A5),
          ),
        ],
      ),
    );
  }
}
