// Round Image
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

buildCircularImage(BuildContext context) {
  return Positioned(
    child: SizedBox(
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.35,
            top: MediaQuery.of(context).size.height * 0.126,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: const ShapeDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: CircleBorder(
                        side: BorderSide(
                          width: 2,
                          color: Color(0xFFFB7E3C),
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.21,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage(ImageConstant.imgFreeHdconvertCom),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
