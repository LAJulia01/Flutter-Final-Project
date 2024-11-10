import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/views/payment/addpaymentmehods.dart';

class Paymentparent extends StatelessWidget {
  const Paymentparent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 231, 249),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios_new, size: 24)),
                const Text(
                  'PAYMENT',
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
                      Icons.settings_rounded,
                      size: 24,
                    )),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 880,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
                    child: Row(
                      children: [
                        Text(
                          'Payment Methods',
                          style: TextStyle(
                            fontFamily: ('Poppins'),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 233, 110, 151),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 160,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 231, 249),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Addpaymentmehods()));
                          },
                          icon: Icon(Icons.add_card),
                          color: Colors.grey,
                          iconSize: 50,
                        ),
                        Text(
                          'Add Payment Methods',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Transaction History',
                          style: TextStyle(
                            fontFamily: ('Poppins'),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 233, 110, 151),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 400,
                    width: 370,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 231, 249),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No Transactional History yet',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Support',
                          style: TextStyle(
                            fontFamily: ('Poppins'),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 233, 110, 151),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 193, 204),
                            fixedSize: Size(140, 50), // specify width, height
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                              30,
                            ))),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: const Color.fromARGB(207, 0, 0, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Help Center',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ('Poppins')),
                      )
                    ],
                  )
                ]),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
