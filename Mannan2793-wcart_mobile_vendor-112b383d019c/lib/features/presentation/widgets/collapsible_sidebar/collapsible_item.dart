import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CollapsibleItem {
  CollapsibleItem({
    required this.text,
    this.badgeCount,
    this.icon,
    this.svgPath,
    this.iconImage,
    required this.onPressed,
    this.onHold,
    this.isSelected = false,
    this.subItems,
  });

  final String text;
  int? badgeCount;
  IconData? icon;
  String? svgPath;
  ImageProvider? iconImage;
  final Function onPressed;
  final Function? onHold;
  bool isSelected;
  List<CollapsibleItem>? subItems;
}
