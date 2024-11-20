import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/requirements/requirements2.dart';
import 'package:nannycare/auth/widgets/customTextField.dart';
import 'package:nannycare/utils/customButton.dart';

class Requirements1 extends StatefulWidget {
  const Requirements1({super.key});

  @override
  State<Requirements1> createState() => RState();
}

class RState extends State<Requirements1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Requirements',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 150, 229),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Parent ',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset('assets/imageava1.png'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color.fromARGB(255, 255, 200, 210),),
                  borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('About Me', style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                )),
              const SizedBox(height: 30),
              const Text(
                'Personal Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(height: 5),
              cstmTextfield('Full name:'),
              const SizedBox(height: 5),
              cstmTextfield('Age:'),
              const SizedBox(height: 5),
              cstmTextfield('Gender:'),
              const SizedBox(height: 5),
              cstmTextfield('Address:'),
              const SizedBox(height: 5),
              cstmTextfield('Birthday:'),
              const SizedBox(
                height: 120,
              ),
              CustomButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Requirements2()));
                  })
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
      child: Row(
        children: [
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(),
    );
  }
}
