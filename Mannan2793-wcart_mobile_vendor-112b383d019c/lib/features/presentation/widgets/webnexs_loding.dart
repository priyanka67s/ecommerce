import 'package:flutter/material.dart';
import 'package:wcart_vendor/util/color_resource.dart';

class WebnexsLoadingWidget extends StatelessWidget {
  const WebnexsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ColorResource.colorffffff,
        child: Center(child: CircularProgressIndicator()));
  }
}
