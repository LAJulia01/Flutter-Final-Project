import 'package:final_project/views/home/widgets/circle_button_widget.dart';
import 'package:final_project/views/message/chat.dart';

import 'package:flutter/material.dart';
import 'package:final_project/views/widgets/bottom_navigation_bar.dart';
import 'package:final_project/utils/styles/styles1.dart';
import 'package:final_project/views/home/search/searchpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final double _scaleFactor = 1.0;
  final Offset _offset = Offset.zero;
  bool _areButtonsVisible = true; // Track button visibility

  void _onScaleStart(ScaleStartDetails details) {}
  void _onScaleUpdate(ScaleUpdateDetails details) {}
  void _onScaleEnd(ScaleEndDetails details) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 2),
      body: Stack(
        children: [
          // Map Section
          GestureDetector(
            onScaleStart: _onScaleStart,
            onScaleUpdate: _onScaleUpdate,
            onScaleEnd: _onScaleEnd,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(_scaleFactor)
                ..translate(_offset.dx, _offset.dy),
              child: Positioned.fill(
                child: Image.asset(
                  'assets/images/map.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // SearchBar Section
          const Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: SearchPage(),
          ),

          // DraggableScrollableSheet
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 1.0, // Full screen height when dragged up
            builder: (context, scrollController) {
              // Monitor the sheet's position
              scrollController.addListener(() {
                setState(() {
                  _areButtonsVisible = scrollController.position.pixels <
                      scrollController.position.maxScrollExtent;
                });
              });

              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16),
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5A7A5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'View 143 Results',
                                style: AppTextStyles.header,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Add your custom content here...',
                          style: AppTextStyles.bodyText,
                        ),
                      ],
                    ),

                    // Circular Buttons Section (Messages and Location)
                    Positioned(
                      top: -136, // Adjust position as needed
                      // top: 16,

                      right: 20,
                      child: Visibility(
                        visible:
                            _areButtonsVisible, // Control visibility dynamically
                        child: Column(
                          children: [
                            // Message Button
                            circleButton(
                              context: context, // Pass the context
                              icon: Icons.message_rounded,
                              targetPage:
                                  const Chat(), // Specify target page
                            ),
                            const SizedBox(height: 10),

                            // Location Button
                            circleButton(
                              context: context, // Pass the context
                              icon: Icons.my_location_rounded,
                              targetPage:
                                  const Chat(), // Specify target page
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
