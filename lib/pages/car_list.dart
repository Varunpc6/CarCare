import 'package:flutter/material.dart';

class ManufacturerListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Bar"),
        actions: [
          const TextField(),
        ],
      ),
    );
  }
}
