// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamaraPage extends StatelessWidget {
  CamaraPage({Key? key}) : super(key: key);

  final ImagePicker _imagePicker = ImagePicker();

  void _openCamera(BuildContext context) async {
    var picture = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );
    // Aquí puedes manejar la imagen tomada desde la cámara
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cámara'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openCamera(context),
          child: Text('Abrir Cámara'),
        ),
      ),
    );
  }
}
