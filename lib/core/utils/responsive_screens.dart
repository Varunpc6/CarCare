import 'package:flutter/material.dart';

class ResSize {
  // Width
  // Infinity Screen Width
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double width14(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.14;
  }

  static double width20(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.20;
  }

  static double width22(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.22;
  }

  static double width23(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.23;
  }

  static double width40(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.40;
  }

  static double width7(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.7;
  }

  static double width8(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.8;
  }

  // Left
  static double left(BuildContext context) {
    return MediaQuery.of(context).size.height * 0;
  }

  static double left02(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
  }

  static double left03(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }

  static double left05(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  static double left06(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.06;
  }

  static double left064(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.064;
  }

  static double dotLeft(BuildContext context, double itemWidth) {
    return MediaQuery.of(context).size.width * 0.5 - (itemWidth / 2);
  }

  static double left07(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.07;
  }

  static double left15(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.15;
  }

  static double left22(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.22;
  }

  static double left3(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.25;
  }

  static double left36(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.36;
  }

  static double left76(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.76;
  }

  // Right
  static double right03(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.03;
  }

  static double right(BuildContext context) {
    return MediaQuery.of(context).size.width * 0;
  }

  static double right04(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.04;
  }

  static double right064(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.064;
  }

  static double right15(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.15;
  }

  static double right25(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.25;
  }

  static double right30(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.30;
  }

  static double right33(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.33;
  }

  // Bottom
  static double bottom(BuildContext context) {
    return MediaQuery.of(context).size.height * 0;
  }

  static double dotBottom(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.1;
  }

  static double dotBottom02(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.02;
  }

  static double dotBottom03(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.03;
  }

  static double dotBottom19(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.19;
  }

  static double navH(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.146;
  }

  static double dotBottom4(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.4;
  }

  static double bottom64(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.64;
  }

  static double bottom8(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.8;
  }

  // Height
  // Infinity Screen Height
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double height05(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  static double height09(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.09;
  }

  static double height1(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.1;
  }

  static double height11(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.11;
  }

  static double height15(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.15;
  }

  static double height25(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.25;
  }

  static double height3(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.3;
  }

  static double height40(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.40;
  }

  static double height55(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.55;
  }

  // Top size 0
  static double top(BuildContext context) {
    return MediaQuery.of(context).size.height * 0;
  }

  static double top03(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }

  static double top033(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.033;
  }

  static double top04(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.04;
  }

  static double top1(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.1;
  }

  static double top125(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.125;
  }

  static double top25(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.14;
  }

  static double top20(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.20;
  }

  static double top34(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.34;
  }

  static double top8(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.8;
  }
}
