import 'package:flutter/material.dart';

class Choice {
  final String title;
  final IconData icon;
  Choice({required this.title, required this.icon});
}

class ChoicePage extends StatelessWidget {
  final Choice choice;

  const ChoicePage({Key? key, required this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        color: const Color.fromARGB(
            255, 255, 255, 255), // Set background color to orange
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              choice.icon,
              size: 50.0,
              color: Colors.black, // Set icon color
            ),
            Text(
              choice.title,
              style: const TextStyle(
                color: Colors.black, // Set text color
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Choice> choices = <Choice>[
  Choice(title: 'General', icon: Icons.directions),
  Choice(title: 'Refuel', icon: Icons.directions),
  Choice(title: 'Expense', icon: Icons.directions),
  Choice(title: 'Income', icon: Icons.directions),
  Choice(title: 'Service', icon: Icons.directions),
  Choice(title: 'Route', icon: Icons.directions),
];