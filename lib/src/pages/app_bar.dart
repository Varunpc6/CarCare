import 'package:car_maintanance/src/pages/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends SliverPersistentHeaderDelegate {
  final double height;

  const CustomAppBar({required this.height, required int leadingWidth, required leading, required title});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: height,
              child: const CustomPaint(
                painter: CustomToolbarShape(lineColor: Colors.deepOrange),
              )),
          Align(
            alignment: const Alignment(0.0, 1.25),
            child: Container(
              height: MediaQuery.of(context).size.height / 14.5,
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20.0,
                      // shadow
                      spreadRadius: .5,
                      // set effect of extending the shadow
                      offset: Offset(
                        0.0,
                        5.0,
                      ),
                    )
                  ],
                ),
                child: TextField(
                  onSubmitted: (submittedText) {},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.9, 0.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery.of(context).size.width / 13,
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.local_mall,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.9, 0.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery.of(context).size.width / 13,
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
