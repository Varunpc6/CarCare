import 'package:flutter/material.dart';

class Choice {
  final String title;
  final IconData icon;

  const Choice({required this.title, required this.icon});
}

List<Choice> choices = <Choice>[
  const Choice(title: 'General', icon: Icons.directions),
  const Choice(title: 'Refuel', icon: Icons.fireplace_outlined),
  const Choice(title: 'Expense', icon: Icons.equalizer_sharp),
  const Choice(title: 'Income', icon: Icons.move_to_inbox),
  const Choice(title: 'Service', icon: Icons.home_repair_service_rounded),
  const Choice(title: 'Route', icon: Icons.room_outlined),
];
