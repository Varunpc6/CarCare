import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/src/pages/my_account_from.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  get context => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.orange,
                      size: 22,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                // Add your text here
                const Text(
                  'My Account',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        body: Stack(
          children: [
            // Background Image Container
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.imgMyAccount1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // User Image
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.orange,
                        width: 2.5,
                      ),
                      image: DecorationImage(
                        image: AssetImage(ImageConstant.imgRectangleAbout),
                        fit: BoxFit
                            .cover, // You can adjust the BoxFit according to your needs
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Image Editing Icon
                  const Icon(
                    Icons.add_a_photo_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  // Side Head
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Username'),
                  ),
                  CustomInfoField(
                    icon: Icons.person,
                    label: 'Username',
                    trailingIcon: Icons.edit,
                    onTrailingIconPressed: () {
                      openDialog(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Align(
                      alignment: Alignment.topLeft, child: Text('Vehicle')),
                  const CustomInfoField(
                    icon: Icons.directions_car,
                    label: 'Car name / no.plate',
                  ),
                  const SizedBox(height: 20),
                  const CustomInfoField(
                    icon: Icons.business,
                    label: 'Manufacturers',
                  ),
                  const SizedBox(height: 20),
                  const CustomInfoField(
                    icon: Icons.directions_car,
                    label: 'Model',
                  ),
                  const SizedBox(height: 20),
                  CustomInfoField(
                    icon: Icons.local_gas_station,
                    label: 'Fuel Capacity',
                    trailingIcon: Icons.edit,
                    onTrailingIconPressed: () {
                      openDialogFuel(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Username',
          style: TextStyle(
            color: Color.fromARGB(255, 253, 115, 73),
          ),
        ),
        content: const TextField(
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text(
              'Ok',
              style: TextStyle(color: Color.fromARGB(236, 255, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }

  openDialogFuel(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Fuel Capacity',
          style: TextStyle(
            color: Color.fromARGB(255, 253, 115, 73),
          ),
        ),
        content: const TextField(
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text(
              'Ok',
              style: TextStyle(color: Color.fromARGB(236, 255, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }
}
