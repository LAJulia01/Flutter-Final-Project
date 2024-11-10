// import 'package:baby_sitter/views/home/search/filterpage.dart';
import 'package:baby_sitter/views/home/search/filterpageYap.dart';
import 'package:flutter/material.dart';
import 'package:baby_sitter/utils/styles1.dart'; // Import the styles

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int filterCount = 0; // This will count the number of filters

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Container(
          width:
              screenWidth * 0.9, // Responsive width (90% of the screen width)
          height: 46, // Fixed height
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(
                255, 249, 235, 240), // Baby pink color for the search bar
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              // Search Icon on the left side
              const Icon(
                Icons.search_rounded,
                color: Color(0xFFF5A7A5),
                size: 24,
              ),

              // TextField for City or Postal Code
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'City or Postal code',
                      hintStyle: TextStyle(color: Colors.black38),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              // Separator (|)
              const Text('|', style: TextStyle(color: Colors.black26)),

              // Filter button with icon and text
              TextButton(
                onPressed: () {
                  // Navigate to FilterPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterPageYap()),
                  );
                },
                child: Row(
                  children: [
                    Stack(
                      children: [
                        const Icon(
                          Icons.filter_list_rounded,
                          color: Colors.black87,
                          size: 24,
                        ),
                        if (filterCount > 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '$filterCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 5), // Space between icon and text
                    Text(
                      'Filters',
                      style: AppTextStyles.bodyText
                          .copyWith(color: Colors.black87),
                    ),
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
