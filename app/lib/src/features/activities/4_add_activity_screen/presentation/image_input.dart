import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({required this.onPickImage, super.key});

  final void Function(Uint8List image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  Uint8List? _selectedImage;
  File? _tempImage;
  final imagePicker = ImagePicker();

  Future<void> _pickImageFromCamera() async {
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      return;
    }
    _selectedImage = await pickedImage.readAsBytes();

    setState(() {
      _tempImage = File(pickedImage.path);
    });

    widget.onPickImage(_selectedImage!);
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    }

    _selectedImage = await pickedImage.readAsBytes();

    setState(() {
    _tempImage = File(pickedImage.path);
    });

    widget.onPickImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      'Add Image',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );

    if (_selectedImage != null) {
      if (kIsWeb) {
        content = Image.network(_tempImage!.path);
      } else {
        content = Image.file(
         _tempImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        );
      }
    }

    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
              color: CustomColors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: content,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text('Capture'),
                onPressed: _pickImageFromCamera,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.upload),
                label: const Text(
                  'Upload',
                ),
                onPressed: _pickImageFromGallery,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
