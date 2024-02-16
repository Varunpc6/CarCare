import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  final String head;
  const PageThree({super.key, required this.head});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  String? carCost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned(
          //   top: 10,
          //   left: 18,
          //   child: Text(
          //     widget.head,
          //     style: const TextStyle(
          //       fontSize: 30.0,
          //       color: Colors.orange,
          //     ),
          //   ),
          // ),
          Center(
            child: Icon(
              Icons.car_repair,
              size: 80,
              color: Colors.grey[500],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 500,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        color: Colors.amber,
                        width: 300,
                        height: 30,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Radio(
                                value: 3,
                                groupValue: 1,
                                onChanged: (value) {},
                              ),
                              const Text(
                                'Expense',
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Radio(
                                value: 2,
                                groupValue: 1,
                                onChanged: (value) {},
                              ),
                              const Text(
                                'Service',
                                style: TextStyle(color: Colors.black),
                              ),
                            ]),
                      ),
                      // Add TextFormField at the top
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Type of Services',
                            labelText: 'Type of Services',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Date',
                            labelText: 'Date',
                          ),
                        ),
                      ),
                      const Text('Modal BottomSheet'),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.read_more_sharp,
          size: 26,
          color: Colors.orange,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
