import 'package:car_maintanance/presentation/settings_screen/settings_screen_main.dart';
import 'package:flutter/material.dart';

class RadioExampleWrapper extends StatefulWidget {
  const RadioExampleWrapper({super.key});

  @override
  RadioExampleWrapperState createState() => RadioExampleWrapperState();
}

class RadioExampleWrapperState extends State<RadioExampleWrapper> {
  SingingCharacter? _selectedCharacter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioExample(
          character: _selectedCharacter,
          onChanged: (value) {
            setState(() {
              _selectedCharacter = value;
            });
          },
        ),
      ],
    );
  }
}

class RadioExample extends StatelessWidget {
  final SingingCharacter? character;
  final ValueChanged<SingingCharacter?> onChanged;

  const RadioExample({
    Key? key,
    required this.character,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text(
            '11/2/2024',
            style: TextStyle(color: Colors.black),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.d1,
            groupValue: character,
            onChanged: onChanged,
            activeColor: Colors.orange,
          ),
        ),
        ListTile(
          title: const Text(
            '02/11/2024',
            style: TextStyle(color: Colors.black),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.d2,
            groupValue: character,
            onChanged: onChanged,
            activeColor: Colors.orange,
          ),
        ),
        ListTile(
          title: const Text(
            '2024/02/11',
            style: TextStyle(color: Colors.black),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.d3,
            groupValue: character,
            onChanged: onChanged,
            activeColor: Colors.orange,
          ),
        ),
        ListTile(
          title: const Text(
            '2024/11/02',
            style: TextStyle(color: Colors.black),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.d4,
            groupValue: character,
            onChanged: onChanged,
            activeColor: Colors.orange,
          ),
        ),
        ListTile(
          title: const Text(
            '11/2024/02',
            style: TextStyle(color: Colors.black),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.d5,
            groupValue: character,
            onChanged: onChanged,
            activeColor: Colors.orange,
          ),
        ),
        ListTile(
          title: const Text(
            '02/2024/11',
            style: TextStyle(color: Colors.black),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.d6,
            groupValue: character,
            onChanged: onChanged,
            activeColor: Colors.orange,
          ),
        ),
      ],
    );
  }
}
