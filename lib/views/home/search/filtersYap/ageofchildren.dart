
import 'package:final_project/utils/styles/style/textstyle.dart';
import 'package:flutter/material.dart';

class AgeOfChildren extends StatefulWidget {
  const AgeOfChildren({super.key});

  @override
  _AgeOfChildrenState createState() => _AgeOfChildrenState();
}

class _AgeOfChildrenState extends State<AgeOfChildren> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Age of children',
          style: AppTextStyles.subHeader,
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
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
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Babysitter",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Checkbox(
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Nanny",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked3,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked3 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Pre schooler",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked4,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked4 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Grade schooler",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked5,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked5 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Teenager",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
