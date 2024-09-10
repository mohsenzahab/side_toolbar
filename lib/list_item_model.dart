import 'package:flutter/material.dart';

class ListItemModel {
  final String title;
  final Color color;
  final Color? selectedColor;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final Widget icon;
  final VoidCallback? onTap;

  ListItemModel({
    this.onTap,
    required this.title,
    required this.color,
    required this.icon,
    this.selectedColor,
    this.textStyle,
    this.selectedTextStyle,
  });
}
