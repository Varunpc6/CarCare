import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ExpansionTileControllerApp extends StatefulWidget {
  final String head;
  const ExpansionTileControllerApp({Key? key, required this.head})
      : super(key: key);

  @override
  State<ExpansionTileControllerApp> createState() =>
      _ExpansionTileControllerAppState();
}

class _ExpansionTileControllerAppState
    extends State<ExpansionTileControllerApp> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent, // Remove the divider
        ),
        child: AnimatedSize(
          duration: const Duration(
              milliseconds: 800), // Adjust animation duration as needed
          curve: Curves.elasticOut, // Adjust animation curve as needed
          child: ExpansionTile(
            onExpansionChanged: (expanded) {
              setState(() {
                _isExpanded = expanded;
              });
            },
            title: Text(
              widget.head,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
            ),
            subtitle: const Text(
              'Data1',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            ),
            trailing: const Text(
              'Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              _isExpanded
                  ? Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                      ),
                      // color: AppColors.orange225,
                      alignment: Alignment.center,
                      // padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Data2"),
                          const Text("Data3"),
                          const Text("Data4"),
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 18),
                                  child: Text(
                                    "data5",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete_rounded,
                                    color: AppColors.red,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit_outlined)),
                              IconButton(
                                onPressed: () {
                                  onTap(context);
                                },
                                icon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  // click Next Button
  onTap(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.containerDetailsScreen);
  }
}
