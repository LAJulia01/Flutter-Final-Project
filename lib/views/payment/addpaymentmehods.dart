import 'package:final_project/views/payment/paymentparent.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(Addpaymentmehods());
}

class Addpaymentmehods extends StatelessWidget {
  const Addpaymentmehods({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment Screen',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Paymentparent()));
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(
            'ALL  PAYMENT METHODS',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: ('Poppins'),
              color: Color.fromARGB(255, 233, 110, 151),
            ),
          ),
        ),
        backgroundColor: Colors.pink[50],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Currently Linked',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 233, 110, 151),
                )),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('No Currently Linked')],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Add Methods',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 233, 110, 151),
                )),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.account_balance,
                          color: Color.fromARGB(255, 233, 110, 151),
                        )),
                    SizedBox(width: 10),
                    Text(
                      'Bank Accounts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ('Poppins'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.credit_card_rounded,
                          color: Color.fromARGB(255, 233, 110, 151),
                        )),
                    SizedBox(width: 10),
                    Text(
                      'Cards',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ('Poppins'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.wallet_rounded,
                          color: Color.fromARGB(255, 233, 110, 151),
                        )),
                    SizedBox(width: 10),
                    Text(
                      'E- Wallets',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ('Poppins'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
