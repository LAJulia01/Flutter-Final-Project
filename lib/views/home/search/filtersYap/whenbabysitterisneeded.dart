import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';

class WhenBabbysitterNeeded extends StatefulWidget {
  const WhenBabbysitterNeeded({super.key});

  @override
  _WhenBabbysitterNeededState createState() => _WhenBabbysitterNeededState();
}

class _WhenBabbysitterNeededState extends State<WhenBabbysitterNeeded> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  bool isChecked10 = false;
  bool isChecked11 = false;
  bool isChecked12 = false;
  bool isChecked13 = false;
  bool isChecked14 = false;
  bool isChecked15 = false;
  bool isChecked16 = false;
  bool isChecked17 = false;
  bool isChecked18 = false;
  bool isChecked19 = false;
  bool isChecked20 = false;
  bool isChecked21 = false;
  bool isChecked22 = false;
  bool isChecked23 = false;
  bool isChecked24 = false;
  bool isChecked25 = false;
  bool isChecked26 = false;
  bool isChecked27 = false;
  bool isChecked28 = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'When babbysitter needed',
            style: AppTextStyles.body,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Monday
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Morning",
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Afternoon",
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Evening",
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Night",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              // Monday
              Column(
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  Text(
                    "Mo",
                    style: AppTextStyles.body,
                  ),
                  Checkbox(
                    value: isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked1 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked3,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked3 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked4,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked4 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                ],
              ),
              // Tuersday
              Column(
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  Text(
                    "Tu",
                    style: AppTextStyles.body,
                  ),
                  Checkbox(
                    value: isChecked5,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked5 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked6,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked6 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked7,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked7 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked8,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked8 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                ],
              ),
              // Wednesday
              Column(
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  Text(
                    "We",
                    style: AppTextStyles.body,
                  ),
                  Checkbox(
                    value: isChecked9,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked9 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked10,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked10 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked11,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked11 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked12,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked12 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                ],
              ),
              // Thusday
              Column(
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  Text(
                    "Th",
                    style: AppTextStyles.body,
                  ),
                  Checkbox(
                    value: isChecked28,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked28 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked13,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked13 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked14,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked14 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked15,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked15 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                ],
              ),
              // Friday
              Column(
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  Text(
                    "Fr",
                    style: AppTextStyles.body,
                  ),
                  Checkbox(
                    value: isChecked16,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked16 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked17,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked17 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked18,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked18 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked19,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked19 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                ],
              ),
              // Saturday
              Column(
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  Text(
                    "Sa",
                    style: AppTextStyles.body,
                  ),
                  Checkbox(
                    value: isChecked20,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked20 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked21,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked21 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked22,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked22 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  Checkbox(
                    value: isChecked23,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked23 = value!;
                      });
                    },
                    activeColor: const Color(0xFFF1F6F6),
                    checkColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                ],
              ),

              // // Suturday
              // Column(
              //   children: [
              //     const SizedBox(
              //       width: 0,
              //     ),
              //     Text(
              //       "Su",
              //       style: AppTextStyles.body,
              //     ),
              //     Checkbox(
              //       value: isChecked24,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           isChecked24 = value!;
              //         });
              //       },
              //       activeColor: const Color(0xFFF1F6F6),
              //       checkColor: Colors.black,
              //     ),
              //     Checkbox(
              //       value: isChecked25,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           isChecked25 = value!;
              //         });
              //       },
              //       activeColor: const Color(0xFFF1F6F6),
              //       checkColor: Colors.black,
              //     ),
              //     Checkbox(
              //       value: isChecked26,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           isChecked26 = value!;
              //         });
              //       },
              //       activeColor: const Color(0xFFF1F6F6),
              //       checkColor: Colors.black,
              //     ),
              //     Checkbox(
              //       value: isChecked27,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           isChecked27 = value!;
              //         });
              //       },
              //       activeColor: const Color(0xFFF1F6F6),
              //       checkColor: Colors.black,
              //     ),
              //     const SizedBox(
              //       width: 0,
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
