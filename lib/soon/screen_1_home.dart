import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  ManufacturerListPage()),
        // );
      },
      child: Container(
        color: const Color.fromARGB(26, 184, 182, 182),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                "assets/car_11.png",
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Car',
              style: TextStyle(fontSize: 25),
            ),
            const RotatedBox(
              quarterTurns: -3,
              child: Card(
                child: Icon(Icons.chevron_right_sharp),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
