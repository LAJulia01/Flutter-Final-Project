import 'package:flutter/material.dart';
import 'package:final_project/utils/customButton.dart';
import 'package:final_project/views/requirements/requirements_page2.dart';


class FilePage1 extends StatefulWidget {
  const FilePage1({super.key});

  @override
  State<FilePage1> createState() => FilePage1State();
}

class FilePage1State extends State<FilePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requirements'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'REQUIREMENTS',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 83, 141),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 10,
                color: Color.fromARGB(255, 0, 0, 0),
                indent: 80,
                endIndent: 80,
                thickness: 2,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NANNY CARE',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 83, 141),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                '1 Personal Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(height: 5),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Full Name:',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 5),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Age:',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 5),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Gender:',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 5),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Birthday:',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                '2. Work Experience',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(
                height: 5,
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: 'Share your work experience...',
                    border: OutlineInputBorder()),
                maxLines: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  child: customBtn('Next', () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NextPage()));
                  })),
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
