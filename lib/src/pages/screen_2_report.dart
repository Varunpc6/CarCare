import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TabBar(
              labelColor: Color.fromRGBO(103, 80, 164, 100),
              isScrollable: true, // Allow tabs to scroll
              labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
              tabs: <Widget>[
                Tab(text: 'GENERAL'),
                Tab(text: 'REFUELING'),
                Tab(text: 'EXPENSE'),
                Tab(text: 'INCOME'),
                Tab(text: 'SERVICE'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Center(child: Text('GENERAL')),
                  Center(child: Text('REFUELING')),
                  Center(child: Text('EXPENSE')),
                  Center(child: Text('INCOME')),
                  Center(child: Text('SERVICE')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
