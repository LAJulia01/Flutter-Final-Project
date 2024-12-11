import 'package:flutter/material.dart';
import 'package:nannycare/babysitter/mainpage2.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainPage2()),
            );
          },
        ),
        title: const Text('Transaction History'),
        backgroundColor: const Color(0xFFF5A7A5),
      ),
      body: const TransactionHistoryList(),
    );
  }
}

class TransactionHistoryList extends StatefulWidget {
  const TransactionHistoryList({super.key});

  @override
  State<TransactionHistoryList> createState() => _TransactionHistoryListState();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text('Transaction History'),
      backgroundColor: Colors.pinkAccent,
    ),
    body: const TransactionHistoryList(),
  );
}

class _TransactionHistoryListState extends State<TransactionHistoryList> {
  
  // Sample data for transaction history
  final List<Map<String, dynamic>> transactions = [
    {
      'name': 'John Doe',
      'date': '2024-12-01',
      'time': '2:00 PM - 6:00 PM',
      'status': 'Completed',
      'amount': 2000.00 // Converted to PHP
    },
    {
      'name': 'Jane Smith',
      'date': '2024-11-28',
      'time': '9:00 AM - 12:00 PM',
      'status': 'Cancelled',
      'amount': 0.00
    },
    {
      'name': 'Robert Brown',
      'date': '2024-11-15',
      'time': '3:00 PM - 8:00 PM',
      'status': 'Completed',
      'amount': 3750.00 // Converted to PHP
    },
    {
      'name': 'Emily Davis',
      'date': '2024-11-10',
      'time': '10:00 AM - 3:00 PM',
      'status': 'Completed',
      'amount': 2500.00 // Converted to PHP
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transaction['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Chip(
                      label: Text(
                        transaction['status'],
                        style: TextStyle(
                          color: transaction['status'] == 'Completed' 
                              ? Colors.green 
                              : Colors.red,
                        ),
                      ),
                      backgroundColor: transaction['status'] == 'Completed' 
                          ? Colors.green.shade100 
                          : Colors.red.shade100,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date: ${transaction['date']}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Time: ${transaction['time']}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Text(
                      '₱${transaction['amount'].toStringAsFixed(2)}', // Changed to Peso symbol
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
