import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String svg;
  final double? widget;
  final double? height;
  final String? color;
  final BoxFit? fit;

  const SvgIcon(
    this.svg, {
    super.key,
    this.height,
    this.widget,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      fit: fit ?? BoxFit.scaleDown,
      width: widget,
      height: height,
    );
  }
}
