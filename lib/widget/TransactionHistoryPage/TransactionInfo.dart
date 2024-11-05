import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/TransactionHistory.dart';
import 'package:module2_4_lab_exercise/styles.dart';
import 'package:module2_4_lab_exercise/widget/TransactionHistoryPage/OverlayPage.dart';

class TransactionInfo extends StatelessWidget {
  const TransactionInfo({super.key, required this.transactionHistory});

  final TransactionHistory transactionHistory;

  showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    dynamic remove;

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        return OverlayPage(
          transactionHistory: transactionHistory,
          onPressed: () {
            remove.remove();
          },
        );
      },
    );

    overlayState.insert(overlayEntry);
    remove = overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showOverlay(context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: GlobalStyles.paddingStyle(20, 15),
        decoration: BoxDecoration(
          color: GlobalStyles.containerColor.withOpacity(0.3),
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
                  style: GlobalStyles.textStyle(
                      18, GlobalStyles.leadingColor, FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  transactionHistory.time,
                  style: GlobalStyles.textStyle(
                      10, GlobalStyles.leadingColor, FontWeight.normal),
                ),
                const SizedBox(height: 5),
                Text(
                  "Send Money",
                  style: GlobalStyles.textStyle(
                      20, GlobalStyles.leadingColor, FontWeight.w200),
                ),
                const SizedBox(height: 5),
              ],
            ),
            Row(
              children: [
                Text(
                  '+',
                  style: GlobalStyles.textStyle(
                      20, GlobalStyles.leadingColor, FontWeight.bold),
                ),
                Text(
                  "${transactionHistory.amount.toStringAsFixed(2)}",
                  style: GlobalStyles.textStyle(
                      20, GlobalStyles.leadingColor, FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
