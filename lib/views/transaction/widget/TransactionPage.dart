import 'package:flutter/material.dart';
import 'package:nannycare/views/transaction/widget/TransactionInfo.dart';

import '../model/TransactionHistoryData.dart';

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
