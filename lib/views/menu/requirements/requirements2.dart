import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/requirements/model/file_page.dart';
import 'package:nannycare/views/menu/requirements/requirements3.dart';
import 'package:nannycare/utils/customButton.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Requirements2 extends StatefulWidget {
  const Requirements2({super.key});

  @override
  State<Requirements2> createState() => Requirements2State();
}

class Requirements2State extends State<Requirements2> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Requirements',
          style: TextStyle(color: Color.fromARGB(255, 255, 150, 229)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 34),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Work Experience',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                  color: Color.fromARGB(255, 255, 200, 210),
                )
            ),
              border: const OutlineInputBorder(
              ),
                    hintText: 'Share your work experience...',
                    ),
                maxLines: 7,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Certifications',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 350),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: ['pdf', 'mp4']);
                    if (result == null) return;
                    openFiles(result.files);

                    //ope sigle file
                    final file = result.files.first;
                    openFile(file);

                    print('Name: ${file.name}');
                    print('bytes: ${file.name}');
                    print('Name: ${file.size}');
                    print('Extension: ${file.extension}');
                    print('Path: ${file.path}');

                    final newFile = await saveFilePermently(file);

                    print('From Path: ${file.path!}');
                    print('To Path: ${newFile.path}');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width.width,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 255, 200, 210),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'attach file',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.upload_file,
                          size: 30,
                        ),
                      ],
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 34),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Valid IDs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 350),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: ['pdf', 'mp4']);
                    if (result == null) return;
                    openFiles(result.files);

                    //ope sigle file
                    final file = result.files.first;
                    openFile(file);

                    print('Name: ${file.name}');
                    print('bytes: ${file.name}');
                    print('Name: ${file.size}');
                    print('Extension: ${file.extension}');
                    print('Path: ${file.path}');

                    final newFile = await saveFilePermently(file);

                    print('From Path: ${file.path!}');
                    print('To Path: ${newFile.path}');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width.width,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 255, 200, 210),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'attach file',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.upload_file,
                          size: 30,
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 40,),
            CustomButton(
                text: 'Next',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ParentNextpage3()));
                })
          ],
        ),
      ),
    );
  }

  void openFiles(List<PlatformFile> files) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FilePage(
            files: files,
            onOpenedFile: openFile,
          ),
        ),
      );

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}

Future<File> saveFilePermently(PlatformFile file) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final newFile = File('${appStorage.path}/${file.name}');

  return File(file.path!).copy(newFile.path);
}
