import 'package:flutter/material.dart';
import 'package:nannycare/auth/views/loginpage.dart';
import 'package:nannycare/utils/customButton.dart';

class Opening extends StatefulWidget {
  const Opening({super.key});

  @override
  State<Opening> createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image3.png'),
                  SizedBox(height: 30,),
          CustomButton(text: 'LOG IN', onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
          }),
          SizedBox(height: 270,),
          footerTitle((){
                         // Navigate to the RegisterPage
          }, 'Not Register yet?','REGISTER'),
        ],
      ),
      ),
     
    );
  }
}
