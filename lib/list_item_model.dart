import 'package:flutter/material.dart';

class ListItemModel {
  final String title;
  final Color color;
  final Color? selectedColor;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final Widget icon;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  ListItemModel({
    this.onTap,
    required this.title,
    required this.color,
    required this.icon,
    this.borderRadius,
    this.selectedColor,
    this.textStyle,
    this.selectedTextStyle,
  });
}
