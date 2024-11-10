import 'package:flutter/material.dart';
import 'package:baby_sitter/utils/style/textstyle.dart';

class TypesOfBabysitter extends StatefulWidget {
  const TypesOfBabysitter({Key? key}) : super(key: key);

  @override
  _TypesOfBabysitterState createState() => _TypesOfBabysitterState();
}

class _TypesOfBabysitterState extends State<TypesOfBabysitter> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Types of babysitter needed',
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Other parent",
                          style: AppTextStyles.body,
                        ),
                        const Text(
                          "(parents-help-parents)",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
