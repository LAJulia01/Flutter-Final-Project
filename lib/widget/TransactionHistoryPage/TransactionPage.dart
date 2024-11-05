import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/TransactionHistoryData.dart';
import 'package:module2_4_lab_exercise/widget/TransactionHistoryPage/TransactionInfo.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key, required this.transactionData});

  final TransactionHistoryData transactionData;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: transactionData.transactionList.map((transactions) {
          return TransactionInfo(
            transactionHistory: transactions,
          );
        }).toList(),
      ),
    );
  }
}
