import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/views/file_page.dart';
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
          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 34),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Certifications',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(32),
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
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'attach file',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.upload_file,
                        size: 40,
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 34),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Valid ID',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(32),
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
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'attach file',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.upload_file,
                        size: 40,
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () {},
              child: const Text(
                'Submit',
              ),
            ),
          ),
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
