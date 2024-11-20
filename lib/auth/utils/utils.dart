import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagepicker = ImagePicker();
  final XFile? file = await imagepicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }

  print('No Images Selected');
}
