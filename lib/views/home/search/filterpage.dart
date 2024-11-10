import 'package:baby_sitter/views/home/search/filters/minimumrateperhour.dart';
import 'package:baby_sitter/views/home/search/filters/numberofchildren.dart';
import 'package:baby_sitter/views/home/search/filters/sort.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous page
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                'Filters',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Sort widget or filter options
              SortPage(),

              SizedBox(height: 16),

              // Number of Children
              NumberOfChildren(),

              SizedBox(height: 16),

              // Minimum rate per hour
              MinRateHour(),
            ],
          ),
        ),
      ),
    );
  }
}
