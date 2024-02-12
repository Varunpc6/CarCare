import 'package:car_maintanance/soon/screen_vehicle_details.dart';
// import 'package:car_maintanance/src/main_properties/app_properties.dart';
import 'package:flutter/material.dart';

class ManufacturerListPage extends StatelessWidget {
  const ManufacturerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: myColor,
          toolbarHeight: screenHeight * 0.15,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Vehicles',
            style: TextStyle(color: Colors.white),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.01),
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.15,
                  bottom: screenHeight * 0.01,
                  right: screenWidth * 0.04),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                  prefixIconColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255,
                          255), // Set your desired color for the underline
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailPage()),
            );
          },
          // backgroundColor: myColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
