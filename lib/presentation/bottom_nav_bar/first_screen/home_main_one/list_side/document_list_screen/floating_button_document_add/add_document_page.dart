import 'dart:io';

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/document_form.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/documents_db/document_db.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({Key? key}) : super(key: key);

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  String? _imageString;
// DataBase instance
  final User documentData = User();

  String? selectedDocumentType;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _onDoneButtonPressed() async {
    if (selectedDocumentType == null && _image == null) {
      // Show snackbar if neither document type nor image is selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in the form.')),
      );
    } else if (selectedDocumentType == null) {
      // Show snackbar if document type is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a document type.')),
      );
    } else if (_image == null) {
      // Show snackbar if image is not added
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add an image.')),
      );
    } else {
      final updatedDocument = DocumentModel(
        nameDoc: selectedDocumentType,
        imageDoc: _imageString,
      );

      // store the data
      await documentData.updateUserDocument(updatedDocument);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(ConstName.document),
        actions: [
          IconButton(
            onPressed: _onDoneButtonPressed,
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Document Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Radio<String>(
                  value: 'Insurance',
                  groupValue: selectedDocumentType,
                  onChanged: (value) {
                    setState(() {
                      selectedDocumentType = value;
                    });
                  },
                ),
                const Text('Insurance'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'Licenses',
                  groupValue: selectedDocumentType,
                  onChanged: (value) {
                    setState(() {
                      selectedDocumentType = value;
                    });
                  },
                ),
                const Text('Licenses'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Pollution',
                  groupValue: selectedDocumentType,
                  onChanged: (value) {
                    setState(() {
                      selectedDocumentType = value;
                    });
                  },
                ),
                const Text('Pollution'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'RC',
                  groupValue: selectedDocumentType,
                  onChanged: (value) {
                    setState(() {
                      selectedDocumentType = value;
                    });
                  },
                ),
                const Text('RC'),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.camera_alt),
                              title: const Text('Take a Picture'),
                              onTap: () async {
                                Navigator.pop(context);
                                final XFile? image = await _picker.pickImage(
                                    source: ImageSource.camera);
                                if (image != null) {
                                  setState(() {
                                    _image = image;
                                  });
                                  saveDocument(
                                      selectedDocumentType!, _image!.path);
                                }
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Choose from Gallery'),
                              onTap: () async {
                                Navigator.pop(context);
                                final XFile? image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                if (image != null) {
                                  setState(() {
                                    _image = image;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'Add Image',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible: _image != null,
                child: _image != null
                    ? Image.file(
                        File(_image!.path),
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveDocument(String type, String imagePath) async {
    final documentBox = await Hive.openBox<DocumentModel>('documents');
    final document = DocumentModel(nameDoc: type, imageDoc: imagePath);
    await documentBox.add(document);

    // Convert image file to a base64 string
    final bytes = File(imagePath).readAsBytesSync();
    setState(() {
      _imageString = base64Encode(bytes);
    });
  }
}
