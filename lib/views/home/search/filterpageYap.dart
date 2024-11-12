import 'package:flutter/material.dart';
import 'package:nannycare/views/home/mainpage.dart';
import 'package:nannycare/views/home/search/filters/minimumrateperhour.dart';
import 'package:nannycare/views/home/search/filters/numberofchildren.dart';
import 'package:nannycare/views/home/search/filters/sort.dart';
import 'package:nannycare/views/home/search/filtersYap/Needsbabycomfortablewith.dart';
import 'package:nannycare/views/home/search/filtersYap/Preferredbabysittinglocation.dart';
import 'package:nannycare/views/home/search/filtersYap/ageofchildren.dart';
import 'package:nannycare/views/home/search/filtersYap/btn.dart';
import 'package:nannycare/views/home/search/filtersYap/spokenlanguage.dart';
import 'package:nannycare/views/home/search/filtersYap/typesofbabysitter.dart';
import 'package:nannycare/views/home/search/filtersYap/verification.dart';
import 'package:nannycare/views/home/search/filtersYap/whenbabysitterisneeded.dart';

class FilterPageYap extends StatefulWidget {
  const FilterPageYap({super.key});

  @override
  State<FilterPageYap> createState() => _FilterPageYapState();
}

class _FilterPageYapState extends State<FilterPageYap> {
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Filters',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: const [
                    // Sort widget or filter options
                    SortPage(), // Removed const

                    SizedBox(height: 16),

                    // Types of babysitter
                    TypesOfBabysitter(), // Removed const

                    SizedBox(height: 16),

                    // Number of Children
                    NumberOfChildren(), // Removed const

                    SizedBox(height: 16),

                    // Age of children
                    AgeOfChildren(), // Removed const

                    SizedBox(height: 16),

                    // Verification
                    Verification(), // Removed const

                    SizedBox(height: 16),

                    // When a babysitter is needed
                    WhenBabbysitterNeeded(), // Removed const

                    SizedBox(height: 16),

                    //Preferred babysitting location
                    PreferredBabysittingLocation(), // Removed const

                    SizedBox(height: 16),

                    // Minimum rate per hour
                    MinRateHour(), // Removed const

                    SizedBox(height: 16),

                    // Needs a babysitter comfortable with
                    BabyComfortableWith(), // Removed const

                    SizedBox(height: 16),

                    // Spoken Languages
                    SpokenLanguage(), // Removed const

                    SizedBox(height: 16),

                    // btn
                    Btn(
                      label: 'View 27 results',
                      destination: MainPage(),
                      backgroundColor: Colors.pink,
                      textColor: Colors.white,
                    ), // Removed const
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
