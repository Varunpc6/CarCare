import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/src/pages/widgets/radio_button_settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
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
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
        ),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Units",
                style: TextStyle(color: Colors.orange),
              ),
              const SizedBox(height: 5),
              Text(
                "km / Miles",
                style: TextStyle(
                  color: Colors.white
                      .withOpacity(0.5), // Adjust the opacity here (0.0 - 1.0)
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Fuel efficiency",
                style: TextStyle(
                  color: Colors.white, // Adjust the opacity here (0.0 - 1.0)
                ),
              ),
              Text(
                "Km / Litre",
                style: TextStyle(
                  color: Colors.white
                      .withOpacity(0.5), // Adjust the opacity here (0.0 - 1.0)
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                "Reminders",
                style: TextStyle(color: Colors.orange),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () {
                  onTapAdvance(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Distance in advance",
                      style: TextStyle(
                        color: Colors.white.withOpacity(
                            0.8), // Adjust the opacity here (0.0 - 1.0)
                      ),
                    ),
                    Text(
                      "Show reminder 500 km in advance.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(
                            0.5), // Adjust the opacity here (0.0 - 1.0)
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Days in advance",
                      style: TextStyle(
                        color: Colors.white.withOpacity(
                            0.8), // Adjust the opacity here (0.0 - 1.0)
                      ),
                    ),
                    Text(
                      "Show reminder 30 days in advance.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(
                            0.5), // Adjust the opacity here (0.0 - 1.0)
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  onTapDays(context);
                },
              ),
              const SizedBox(height: 18),
              const Text(
                "Formats",
                style: TextStyle(color: Colors.orange),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  onTapSeventeenMillionOneHundredTwen(
                      context); // Pop here to change this code
                },
                child: SizedBox(
                  height: 33,
                  width: 87,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "17 / 12 /2023",
                          style: TextStyle(
                            color: Colors.white.withOpacity(
                                0.5), // Adjust the opacity here (0.0 - 1.0)
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Date format",
                          style: TextStyle(
                            color: Colors.white.withOpacity(
                                0.8), // Adjust the opacity here (0.0 - 1.0)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Currency format",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "₹10,00,000.000",
                style: TextStyle(
                  color: Colors.white
                      .withOpacity(0.5), // Adjust the opacity here (0.0 - 1.0)
                ),
              ),
              const SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the moreOneScreen when the action is triggered.
  onTapContrast(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }

  /// Navigates to the dateFormatScreen when the action is triggered.
  onTapSeventeenMillionOneHundredTwen(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Date format ",
            style: TextStyle(color: Color.fromARGB(255, 252, 66, 9)),
          ),
          content: const SizedBox(
            height: 340,
            child: RadioExampleWrapper(),
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
        );
      },
    );
  }

  /// click Pop on Distance
  onTapAdvance(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Distance in advance",
            style: TextStyle(color: Color.fromARGB(255, 252, 66, 9)),
          ),
          content: const TextField(),
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
        );
      },
    );
  }

  /// click Pop on Days
  onTapDays(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Days in advance",
              style: TextStyle(color: Color.fromARGB(255, 252, 66, 9)),
            ),
            content: const TextField(),
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
          );
        });
  }
}

// Radio Button Model
enum SingingCharacter { d1, d2, d3, d4, d5, d6 }
