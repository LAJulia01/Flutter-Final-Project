import 'package:flutter/material.dart';
import 'package:nannycare/views/home/mainpage.dart';
import 'package:nannycare/views/message/chat.dart';
import 'package:nannycare/views/message/chat2.dart';

class Chathome extends StatelessWidget {
  const Chathome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 231, 249),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios_new, size: 20),
                    ),
                    const Text(
                      'MESSAGES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ('Poppins'),
                        fontSize: 20,
                        color: Color.fromARGB(255, 233, 110, 151),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Color.fromARGB(207, 255, 255, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildProfile('assets/nica.jpg', "Nica"),
                        SizedBox(width: 25),
                        _buildProfile('assets/cj.jpg', "Christine"),
                        SizedBox(width: 25),
                        _buildProfile('assets/elvie.jpg', "Elvie"),
                        SizedBox(width: 25),
                        _buildProfile('assets/bugay.jpg', "Bernilyn"),
                        SizedBox(width: 25),
                        _buildProfile('assets/pic1 (1).jpg', "Leizel"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'R E C E N T  M E S S A G E',
                  style: TextStyle(
                    color: Color.fromARGB(255, 233, 110, 151),
                    fontWeight: FontWeight.bold,
                    fontFamily: ('Poppins'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(207, 255, 255, 255),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildMessage(context, 'assets/nica.jpg', 'Nica Felizardo', 'Nica@gmail.com', '8:43', Chat2()),
                    _buildMessage(context, 'assets/elvie.jpg', 'Elvie Torrenueva', 'torrenueva@gmail.com', 'Tue', Chat()),
                    _buildMessage(context, 'assets/cj.jpg', 'Christine Joy Dura', 'Dura@gmail.com', 'Tue', Chat()),
                    _buildMessage(context, 'assets/bugay.jpg', 'Bernilyn Bugay', 'Bugay@gmail.com', 'Wed', Chat()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(String imagePath, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(imagePath),
        ),
        Text(
          name,
          style: TextStyle(fontSize: 18, fontFamily: ('Poppins')),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildMessage(BuildContext context, String imagePath, String name, String email, String time, Widget chatPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => chatPage));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(time),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    email,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 117, 116, 116),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
