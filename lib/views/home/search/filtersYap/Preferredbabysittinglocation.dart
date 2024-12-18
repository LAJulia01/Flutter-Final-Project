import 'package:final_project/utils/styles/style/textstyle.dart';
import 'package:flutter/material.dart';

class PreferredBabysittingLocation extends StatefulWidget {
  const PreferredBabysittingLocation({super.key});

  @override
  _PreferredBabysittingLocationState createState() =>
      _PreferredBabysittingLocationState();
}

class _PreferredBabysittingLocationState
    extends State<PreferredBabysittingLocation> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferred babysitting location',
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
                    "At the babysitter’s",
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
                    "At the family",
                    style: AppTextStyles.body,
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
