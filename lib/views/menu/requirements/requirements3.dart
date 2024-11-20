import 'package:flutter/material.dart';
import 'package:nannycare/auth/widgets/customTextField.dart';
import 'package:nannycare/auth/widgets/dialogbutton.dart';

class ParentNextpage3 extends StatefulWidget {
  const ParentNextpage3({super.key});

  @override
  State<ParentNextpage3> createState() => ParentNextpage3State();
}

class ParentNextpage3State extends State<ParentNextpage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Requirements',
          style: TextStyle(color: Color.fromARGB(255, 255, 150, 229)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Have experience caring for children',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'with special needs.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 255, 200, 210),
                    ),
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Yes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                SizedBox(height: 10,),
                   Container(
              width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 255, 200, 210),
                    ),
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Row(
              children: [
                Text(
                  'Rate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
                        SizedBox(
              height: 5,
            ),
            cstmTextfield('Amount:'),
            SizedBox(height: 20,),
            cstmTextfield('Hours:'),
            SizedBox(height: 300,),
           AlertDialog1(),
          ],
        ),
      ),
    );
  }
}
