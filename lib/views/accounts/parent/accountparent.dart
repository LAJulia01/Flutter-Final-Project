import 'package:flutter/material.dart';

class Accountparent extends StatelessWidget {
  const Accountparent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 231, 249),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new, size: 24)),
              const Text(
                'EDIT PROFILE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: ('Poppins'),
                  fontSize: 18,
                  color: Color.fromARGB(255, 233, 110, 151),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_rounded,
                    size: 24,
                  )),
            ],
          ),
        ),
        Container(
          height: 880,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 15, bottom: 20, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile Picture',
                        style: TextStyle(
                          fontFamily: ('Poppins'),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 233, 110, 151),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_rounded,
                            color: Color.fromARGB(255, 233, 110, 151),
                          ))
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: Image.asset('assets/nica.jpg').image,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 5, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Details',
                        style: TextStyle(
                          fontFamily: ('Poppins'),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 233, 110, 151),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_rounded,
                            color: Color.fromARGB(255, 233, 110, 151),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: Container(
                    height: 115,
                    width: 370,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 231, 249),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add a short detail to tell people more about yourself.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 5, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Intro',
                        style: TextStyle(
                          fontFamily: ('Poppins'),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 233, 110, 151),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_rounded,
                            color: Color.fromARGB(255, 233, 110, 151),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 135,
                    width: 370,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 231, 249),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.house,
                                color: Color.fromARGB(255, 233, 110, 151),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Current City',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('Poppins'),
                                    color: Color.fromARGB(255, 233, 110, 151)),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 233, 110, 151),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Charactiristics',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('Poppins'),
                                    color: Color.fromARGB(255, 233, 110, 151)),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.cookie,
                                color: Color.fromARGB(255, 233, 110, 151),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Skills',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('Poppins'),
                                    color: Color.fromARGB(255, 233, 110, 151)),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.edit_document,
                                color: Color.fromARGB(255, 233, 110, 151),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'More...',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ('Poppins'),
                                    color: Color.fromARGB(255, 233, 110, 151)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured',
                        style: TextStyle(
                          fontFamily: ('Poppins'),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 233, 110, 151),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_rounded,
                            color: Color.fromARGB(255, 233, 110, 151),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: Container(
                    height: 100,
                    width: 370,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 231, 249),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Feature your Certificates and Valid IDs here for all  to see.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 193, 204),
                            fixedSize: Size(250, 50), // specify width, height
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                              10,
                            ))),
                        child: Text(
                          "Edit your About info",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: const Color.fromARGB(207, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ])),
    );
  }
}
