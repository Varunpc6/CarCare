import 'package:flutter/material.dart';

class RegisterVehicle extends StatelessWidget {
  const RegisterVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vehicle',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(103, 80, 164, 1),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/download.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextFieldWithIcon(
                  icon: Icons.person,
                  labelText: 'Owner Name',
                ),
                const SizedBox(height: 16),
                _buildTextFieldWithIcon(
                  icon: Icons.car_rental,
                  labelText: 'Car Model',
                ),
                const SizedBox(height: 16),
                _buildTextFieldWithIcon(
                  icon: Icons.confirmation_number,
                  labelText: 'License Plate',
                ),
                const SizedBox(height: 16),
                _buildTextFieldWithIcon(
                  icon: Icons.calendar_today,
                  labelText: 'Manufacture Year',
                ),
                const SizedBox(height: 16),
                _buildTextFieldWithIcon(
                  icon: Icons.money,
                  labelText: 'Price',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(
      {required IconData icon, required String labelText}) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.blue,
            offset: Offset(0, 0),
          ),
        ],
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.4),
        prefixIcon: Icon(icon, color: Colors.white),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
