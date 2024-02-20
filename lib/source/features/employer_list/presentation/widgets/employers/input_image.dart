import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
  const InputImage({super.key, required this.onSelectedImage});

  final void Function(File image) onSelectedImage;

  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File? selectedPicture;

  void onTakePicture() async {
    final imagePicker = ImagePicker();
    final pickedPicture =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedPicture == null) {
      return;
    }

    setState(() {
      selectedPicture = File(pickedPicture.path);
    });

    widget.onSelectedImage(selectedPicture!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                style: BorderStyle.solid,
                width: 5,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.3))),
        child: Center(
            child: GestureDetector(
          onTap: onTakePicture,
          child: selectedPicture == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                        opacity: 0.8,
                        child: Text(
                          "Take a picture",
                          style: Theme.of(context).textTheme.titleSmall,
                        )),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.camera,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                )
              : Image.file(selectedPicture!),
        )));
  }
}
