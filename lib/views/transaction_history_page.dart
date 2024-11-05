import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/models/TransactionHistoryData.dart';
import 'package:module2_4_lab_exercise/styles.dart';
import 'package:module2_4_lab_exercise/widget/CustomAppBar.dart';
import 'package:module2_4_lab_exercise/widget/TransactionHistoryPage/TransactionPage.dart';

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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          leadingWidth: width,
          leading: const CustomAppBar(title: 'Transaction History'),
        ),
        body: Container(
          margin: GlobalStyles.paddingStyle(20, 10),
          child: ListView(
            controller: _scrollController,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Today',
                style: GlobalStyles.textStyle(
                    20, GlobalStyles.leadingColor, FontWeight.w700),
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
