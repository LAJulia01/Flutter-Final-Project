import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/views/message/chat.dart';
import 'package:module2_4_lab_exercise/views/message/chat2.dart';

class Chathome extends StatelessWidget {
  const Chathome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 231, 249),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_new, size: 20)),
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
                      ))
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
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: Image.asset('assets/nica.jpg').image,
                        ),
                        Text(
                          "Nica",
                          style:
                              TextStyle(fontSize: 18, fontFamily: ('Poppins')),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(width: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: Image.asset('assets/cj.jpg').image,
                        ),
                        Text(
                          "Chirstine",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: ('Poppins'),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(width: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              Image.asset('assets/elvie.jpg').image,
                        ),
                        Text(
                          "Elvie",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: ('Poppins'),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(width: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              Image.asset('assets/bugay.jpg').image,
                        ),
                        Text(
                          "Bernilyn",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: ('Poppins'),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(width: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              Image.asset('assets/pic1 (1).jpg').image,
                        ),
                        Text(
                          "Leizel",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: ('Poppins'),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 35,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    'R E C E N T  M E S S A G E',
                    style: TextStyle(
                      color: Color.fromARGB(255, 233, 110, 151),
                      fontWeight: FontWeight.bold,
                      fontFamily: ('Poppins'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 690,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(207, 255, 255, 255),
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Chat2()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, right: 10),
                          child: Row(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        Image.asset('assets/nica.jpg').image,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nica Felizardo',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 180),
                                      Text(
                                        '8:43',
                                        style: TextStyle(),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Nica@gmail.com',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 117, 116, 116),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Chat()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 15, right: 10),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        Image.asset('assets/elvie.jpg').image,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Elvie Torrenueva',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 162),
                                      Text(
                                        'Tue',
                                        style: TextStyle(),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'torrenueva@gmail.com',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 117, 116, 116),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 15, right: 10),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      Image.asset('assets/cj.jpg').image,
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Christine Joy Dura',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 147),
                                    Text(
                                      'Tue',
                                      style: TextStyle(),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Dura@gmail.com',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 117, 116, 116),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 15, right: 10),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      Image.asset('assets/bugay.jpg').image,
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Bernilyn Bugay',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 174),
                                    Text(
                                      'Wed',
                                      style: TextStyle(),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Bugay@gmail.com',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 117, 116, 116),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
