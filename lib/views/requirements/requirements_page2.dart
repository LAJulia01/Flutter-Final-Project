import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/utils/customButton.dart';
import 'package:module2_4_lab_exercise/views/requirements/requirements_page3.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
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
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 34),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upload Profile Photos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 213, 213, 213),
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
                'Certifications',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 213, 213, 213),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 213, 213, 213),
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
              margin: const EdgeInsets.symmetric(horizontal: 130),
              child: customBtn('Sumbit', () {})),
        ],
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
