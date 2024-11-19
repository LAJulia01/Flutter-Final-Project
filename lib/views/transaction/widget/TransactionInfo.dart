import 'package:flutter/material.dart';
import 'package:nannycare/views/Profile/styles.dart';

import '../model/TransactionHistory.dart';

class TransactionInfo extends StatelessWidget {
  const TransactionInfo({super.key, required this.transactionHistory});

  final TransactionHistory transactionHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: Styles.paddingStyle(20, 15),
      decoration: BoxDecoration(
        color: Styles.containerColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                transactionHistory.name,
                style:
                    Styles.textStyle(18, Styles.leadingColor, FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                transactionHistory.time,
                style: Styles.textStyle(
                    10, Styles.leadingColor, FontWeight.normal),
              ),
              const SizedBox(height: 5),
              Text(
                "Send Money",
                style:
                    Styles.textStyle(18, Styles.leadingColor, FontWeight.w200),
              ),
              const SizedBox(height: 5),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Container(
                        height: MediaQuery.of(context).size.height * .4,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(transactionHistory.img),
                              radius: 80 / 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Send Money',
                                  style: Styles.textStyle(
                                    20,
                                    Styles.leadingColor,
                                    FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' from',
                                  style: Styles.textStyle(
                                    18,
                                    Styles.leadingColor,
                                    FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              transactionHistory.name,
                              style: Styles.textStyle(
                                25,
                                Styles.leadingColor,
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
                                        style: Styles.textStyle(
                                            13,
                                            Styles.leadingColor,
                                            FontWeight.w800),
                                      ),
                                      Text(
                                        "${transactionHistory.amount.toStringAsFixed(2)}",
                                        style: Styles.textStyle(
                                            13,
                                            Styles.leadingColor,
                                            FontWeight.w800),
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
                                        style: Styles.textStyle(
                                            13,
                                            Styles.leadingColor,
                                            FontWeight.w800),
                                      ),
                                      Text(
                                        transactionHistory.time,
                                        style: Styles.textStyle(
                                            13,
                                            Styles.leadingColor,
                                            FontWeight.w800),
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
                          ],
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(),
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFF5A7A5),
                ),
                child: Text(
                  'View All',
                  style: Styles.textStyle(
                      18, Styles.leadingColor, FontWeight.w200),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget transactionDetails(final text, final child) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.textStyle(15, Styles.leadingColor, FontWeight.w600),
        ),
        child
      ],
    );

Widget referenceNumber(final text, final child) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.textStyle(15, Styles.referenceColor, FontWeight.w600),
        ),
        child
      ],
    );
