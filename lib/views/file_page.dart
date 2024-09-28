import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FilePage extends StatefulWidget {
  const FilePage({super.key, required this.files, required this.onOpenedFile});

  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('All Files'),
          centerTitle: true,
        ),
        body: Center(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: widget.files.length,
            itemBuilder: (context, index) {
              final file = widget.files[index];

              return buildFile(file);
            },
          ),
        ),
      );

  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final fileSize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toString()}';
    final extension = file.extension ?? 'none';
    final color = getColor(extension);

    return InkWell(
      onTap: () => OpenFile.open(file.path!),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '.${extension}',
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              file.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              fileSize,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

Color getColor(String extension) {
  switch (extension.toLowerCase()) {
    case 'jpg':
    case 'jpeg':
      return Colors.yellow;
    case 'png':
      return Colors.green;
    case 'gif':
      return Colors.orange;
    case 'pdf':
      return Colors.red;
    case 'doc':
    case 'docx':
      return Colors.blue;
    case 'txt':
      return Colors.grey;
    default:
      return Colors.black; // Default color for unknown types
  }
}
