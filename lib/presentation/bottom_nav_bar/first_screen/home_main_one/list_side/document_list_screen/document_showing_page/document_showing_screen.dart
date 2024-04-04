import 'dart:convert';
import 'dart:typed_data';

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/documents_db/document_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class DocumentShowPage extends StatelessWidget {
  const DocumentShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final DocumentModel documentModel = arguments[ConstName.document];

    // Decode the base64 string back to bytes
    final Uint8List bytes = base64Decode(documentModel.imageDoc!);

    return Scaffold(
      appBar: appBar(Text(documentModel.nameDoc!), documentModel, context),
      body: Center(
        child: SizedBox(
          height: ResSize.height(context),
          width: ResSize.width(context),
          child: Image.memory(
            bytes,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // -- AppBar --
  AppBar appBar(Text mainTitle, DocumentModel data, context) {
    return AppBar(
      backgroundColor: AppColors.orange,
      elevation: 0,
      title: mainTitle,
      actions: [
        IconButton(
            onPressed: () async {
              await User().checkDeleteDocument(data);
              Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
            },
            icon: const Icon(Icons.delete)),
      ],
    );
  }
}
