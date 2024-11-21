import 'package:flutter/material.dart';
import 'package:nannycare/views/Profile/styles.dart';
import 'package:nannycare/views/transaction/model/TransactionHistoryData.dart';
import 'package:nannycare/views/transaction/widget/TransactionPage.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  TransactionHistoryData transactionData = TransactionHistoryData();

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transaction History'),
        ),
        body: Container(
          margin: Styles.paddingStyle(20, 10),
          child: ListView(
            controller: _scrollController,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Today',
                style:
                    Styles.textStyle(20, Styles.leadingColor, FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              TransactionPage(transactionData: transactionData),
            ],
          ),
        ));
  }
}
