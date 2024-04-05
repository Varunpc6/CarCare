import 'package:car_maintanance/hive_main/db/db_functions/second_user_form.dart';
import 'package:car_maintanance/presentation/bottom_nav_bar/second_screen/models/choice.dart';
import 'package:flutter/material.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';

class FutureCountWidget extends StatelessWidget {
  final Choice choice;

  const FutureCountWidget({Key? key, required this.choice}) : super(key: key);

  Future<dynamic> getTabController(String title) async {
    switch (title) {
      case "Tab 1":
        return [
          await User().getAllDataCount(),
          await SecUser().getTotalRefuelPrice()
        ];
      case "Tab 2":
        return [
          await User().getAllDataCount(),
          await SecUser().getTotalRefuelPrice()
        ];
      case "Tab 3":
        return [
          await User().getAllDataCount(),
          await SecUser().getTotalRefuelPrice()
        ];
      case "Tab 4":
        return [
          await User().getAllDataCount(),
          await SecUser().getTotalRefuelPrice()
        ];
      case "Tab 5":
        return [
          await User().getAllDataCount(),
          await SecUser().getTotalRefuelPrice()
        ];
      case "Tab 6":
        return [
          await User().getAllDataCount(),
          await SecUser().getTotalRefuelPrice()
        ];
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: choice.title == "Tab 1"
      //     ? User().getAllDataCount()
      //     : SecUser().getTotalRefuelPrice(),
      future: getTabController(choice.title),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text(
            '${snapshot.data} entries',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          );
        }
      },
    );
  }
}
