import 'dart:io';
import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:car_maintanance/src/pages/my_account_from.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  // Image picker
  File? _image;

  // Database instance
  final User userRegisterApp = User();

  // Holds the currently displayed user data
  MainBoxUser? _user;
  MainBoxUser? _fuelD;

  // Load user data when the widget initializes
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // get image from ImagePicker
  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        final imagePath = _image!.path;
        // Add the image to Hive database
        userRegisterApp.updateUserImage(pic: imagePath);
      } else {
        stdout.write('No image selected.');
      }
    });
  }

  // Method to load user data
  void _loadUserData() async {
    final List<MainBoxUser> users =
        await userRegisterApp.displayRegisterDetails();
    final List<MainBoxUser> fueluser =
        await userRegisterApp.displayRegisterDetails();

    if (users.isNotEmpty) {
      setState(() {
        _user = users[0];
      });
    } else {
      setState(() {
        _user = null; // Set _user to null when no user data is available
      });
    }
    if (fueluser.isNotEmpty) {
      setState(() {
        _fuelD = fueluser[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Background Image Rising on TextField click time
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 22,
                        color: Colors.orange,
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
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.light,
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
                    ),
                    child: (_image != null)
                        ? ClipOval(
                            child: Image.file(
                              _image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : (_user?.image != null && _user!.image!.isNotEmpty)
                            ? ClipOval(
                                child: Image.file(
                                  File(_user?.image as String),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(ImageConstant
                                        .imgRectangleAbout), // Default image asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                  ),
                  const SizedBox(height: 5),
                  // icon camera BottomSheet
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                // photo
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text('Take a Photo'),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    await _getImage(ImageSource.camera);
                                  },
                                ),
                                // Folder
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const Text('Choose from Gallery'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    _getImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // SideHead User
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      ConstName.user,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  // Username
                  GestureDetector(
                    onTap: () {
                      openUsernameDialog(context);
                    },
                    child: CustomInfoField(
                      icon: Icons.person,
                      labelText: _user?.userName ?? '',
                    ),
                  ),
                  const SizedBox(height: 20),
                  // SideHead Vehicle
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      ConstName.vehicle,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  // Car number
                  GestureDetector(
                    onTap: () {
                      openCarDialog(context);
                    },
                    child: CustomInfoField(
                      icon: Icons.directions_car,
                      labelText: _user?.carName ?? '',
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Brand Name
                  GestureDetector(
                    onTap: () {
                      openBrandDialog(context);
                    },
                    child: CustomInfoField(
                      icon: Icons.business,
                      labelText: _user?.brandName ?? '',
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Model Name
                  GestureDetector(
                    onTap: () {
                      openModelDialog(context);
                    },
                    child: CustomInfoField(
                      icon: Icons.directions_car,
                      labelText: _user?.modelName ?? '',
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Fuel
                  CustomInfoField(
                    icon: Icons.local_gas_station,
                    labelText: _fuelD?.fuel ?? 'fuel',
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
    final usernameController = TextEditingController(
        text: _user
            ?.userName); // Controller for username text field with current username

    showDialog(
      barrierColor: AppColors.bgShd1,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          ConstName.editName,
          style: TextStyle(
            color: Color.fromARGB(255, 253, 115, 73),
          ),
        ),
        content: TextField(
          keyboardType: TextInputType.name,
          controller: usernameController,
          style: const TextStyle(
            color: AppColors.blackSh2,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text(
              ConstName.cancel,
              style: TextStyle(color: AppColors.black),
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

  // Method to open dialog for editing carName
  void openCarDialog(BuildContext context) {
    final carNameController = TextEditingController(
        text: _user
            ?.carName); // Controller for carName text field with current carName

    showDialog(
      barrierColor: AppColors.bgShd1,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          ConstName.editCarName,
          style: TextStyle(
            color: Color.fromARGB(255, 253, 115, 73),
          ),
        ),
        content: TextField(
          controller: carNameController,
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
              String newCarName = carNameController.text;
              // Add logic to update username in your database or wherever user data is stored
              setState(() {
                _user?.carName = newCarName;
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

  // Method to open dialog for editing brandName
  void openBrandDialog(BuildContext context) {
    TextEditingController brandController = TextEditingController(
        text: _user
            ?.brandName); // Controller for username text field with current username

    showDialog(
      barrierColor: AppColors.bgShd1,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          ConstName.editBrandName,
          style: TextStyle(
            color: Color.fromARGB(255, 253, 115, 73),
          ),
        ),
        content: TextField(
          controller: brandController,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text(
              ConstName.cancel,
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              // Update username when OK is pressed
              String newBrandName = brandController.text;
              // Add logic to update username in your database or wherever user data is stored
              setState(() {
                _user?.brandName = newBrandName;
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

  // Method to open dialog for editing username
  void openModelDialog(BuildContext context) {
    TextEditingController modelController = TextEditingController(
        text: _user
            ?.modelName); // Controller for username text field with current username

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          ConstName.editModel,
          style: TextStyle(
            color: Color.fromARGB(255, 253, 115, 73),
          ),
        ),
        content: TextField(
          controller: modelController,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text(
              ConstName.cancel,
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              // Update username when OK is pressed
              String newModelName = modelController.text;
              // Add logic to update username in your database or wherever user data is stored
              setState(() {
                _user?.modelName = newModelName;
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
    TextEditingController fuelController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Fuel Capacity',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        content: TextField(
          keyboardType: TextInputType.number,
          controller: fuelController,
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
            onPressed: () async {
              // Get the new fuel value entered by the user
              String newFuel = fuelController.text.trim();

              if (newFuel.isNotEmpty) {
                setState(() {
                  _fuelD?.fuel = newFuel;
                  userRegisterApp.userAdd(fuel: _fuelD?.fuel);
                });
                Navigator.pop(context, 'OK');
              }
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
}
