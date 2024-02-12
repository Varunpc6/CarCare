import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/src/pages/my_account_from.dart';
import 'package:flutter/material.dart';
import 'package:car_maintanance/db/models/db_user_reg/user_db.dart';
import 'package:car_maintanance/db/db_functions/registor_from.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final UserRegisterApp userRegisterApp = UserRegisterApp();
  User? _user; // Holds the currently displayed user data

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load user data when the widget initializes
  }

  // Method to load user data
  void _loadUserData() {
    final List<User> users = userRegisterApp.displayRegisterDetails();
    if (users.isNotEmpty) {
      _user = users[0];
    } else {
      // Set default values if no user data is available
      _user = User(
        userName: 'Username',
        carName: 'Car Name',
        brandName: 'Brand Name',
        modelName: 'Model Name',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // Background Image Rising on TextField click time
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
                  // image Session
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
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Icon(
                    Icons.add_a_photo_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  // SideHead User
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text('User'),
                  ),
                  // Username
                  CustomInfoField(
                    icon: Icons.person,
                    label: _user?.userName ?? '',
                    trailingIcon: Icons.edit,
                    onTrailingIconPressed: () {
                      // Open dialog for editing username
                      openUsernameDialog(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  // SideHead Vehicle
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Vehicle'),
                  ),
                  // Car number
                  CustomInfoField(
                    icon: Icons.directions_car,
                    label: _user?.carName ?? '',
                  ),
                  const SizedBox(height: 20),
                  // Brand Name
                  CustomInfoField(
                    icon: Icons.business,
                    label: _user!.brandName ?? '',
                  ),
                  const SizedBox(height: 20),
                  // Model Name
                  CustomInfoField(
                    icon: Icons.directions_car,
                    label: _user!.modelName ?? '',
                  ),
                  const SizedBox(height: 20),
                  // Fuel
                  CustomInfoField(
                    icon: Icons.local_gas_station,
                    label: 'Fuel Capacity',
                    trailingIcon: Icons.edit,
                    onTrailingIconPressed: () {
                      // Open dialog for editing fuel capacity
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

  // Method to open dialog for editing username
  void openUsernameDialog(BuildContext context) {
    TextEditingController usernameController = TextEditingController(
        text: _user?.userName ??
            ''); // Controller for username text field with current username

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Username',
          style: TextStyle(
            color: Color.fromARGB(255, 253, 115, 73),
          ),
        ),
        content: TextField(
          controller: usernameController,
          style: const TextStyle(
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
            onPressed: () {
              // Update username when OK is pressed
              String newUsername = usernameController.text;
              // Add logic to update username in your database or wherever user data is stored
              setState(() {
                _user?.userName = newUsername;
              });
              Navigator.pop(context, 'OK');
            },
            child: const Text(
              'Ok',
              style: TextStyle(color: Color.fromARGB(236, 255, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }

  // Method to open dialog for editing fuel capacity
  void openDialogFuel(BuildContext context) {
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
