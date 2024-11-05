import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/TransactionHistory.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class OverlayPage extends StatelessWidget {
  const OverlayPage(
      {super.key, required this.transactionHistory, required this.onPressed});

  final TransactionHistory transactionHistory;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(90, 0, 0, 0),
          ),
          width: width,
          height: height,
          child: Container(
            width: width,
            height: height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: GlobalStyles.buttonColor),
            margin: GlobalStyles.paddingStyle(20, 180),
            padding: GlobalStyles.paddingStyle(20, 20),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(transactionHistory.img),
                  radius: 80 / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Send Money',
                      style: GlobalStyles.textStyle(
                        20,
                        GlobalStyles.leadingColor,
                        FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' from',
                      style: GlobalStyles.textStyle(
                        25,
                        GlobalStyles.leadingColor,
                        FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Text(
                  transactionHistory.name,
                  style: GlobalStyles.textStyle(
                    25,
                    GlobalStyles.leadingColor,
                    FontWeight.bold,
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    transactionDetails(
                      'Amount',
                      Row(
                        children: [
                          Text(
                            '+',
                            style: GlobalStyles.textStyle(
                                15, GlobalStyles.leadingColor, FontWeight.w800),
                          ),
                          Text(
                            "${transactionHistory.amount.toStringAsFixed(2)}",
                            style: GlobalStyles.textStyle(
                                15, GlobalStyles.leadingColor, FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    transactionDetails(
                      'Date & Time',
                      Row(
                        children: [
                          Text(
                            transactionHistory.date,
                            style: GlobalStyles.textStyle(
                                15, GlobalStyles.leadingColor, FontWeight.w800),
                          ),
                          Text(
                            transactionHistory.time,
                            style: GlobalStyles.textStyle(
                                15, GlobalStyles.leadingColor, FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    referenceNumber(
                      'Reference no.',
                      const Text("QWERT52SDQW"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 40),
                        backgroundColor: GlobalStyles.iconColor),
                    onPressed: onPressed,
                    child: const Text('cancel'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget transactionDetails(final text, final child) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GlobalStyles.textStyle(
              15, GlobalStyles.leadingColor, FontWeight.w800),
        ),
        child
      ],
    );

Widget referenceNumber(final text, final child) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GlobalStyles.textStyle(
              15, GlobalStyles.referenceColor, FontWeight.w800),
        ),
        child
      ],
    );
