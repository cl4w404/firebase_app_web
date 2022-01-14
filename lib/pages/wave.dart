import 'package:flutter/material.dart';
class WaveShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {

    double height = size.height;
    double width = size.width;
    var p = Path();
    p.lineTo(0, 0);
    p.cubicTo(width * 1 / 2, 0, width * 2 / 4, height, width, height);
    p.lineTo(width, 0);
    p.close();
    return p;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}


class WaveShape1 extends CustomClipper<Path> {
  @override
  getClip(Size size) {

    double height = size.height;
    double width = size.width;
    var p = Path();
    p.lineTo(4, size.height);
    p.cubicTo(width * 0, 1/6, width * 2/ 4, height, width, height);
    p.lineTo(size.width, 0);
    p.close();
    return p;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

