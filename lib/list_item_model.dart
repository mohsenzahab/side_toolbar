import 'package:flutter/material.dart';

class ListItemModel {
  final String title;
  final Color color;
  final Widget icon;
  final VoidCallback onTap;

  ListItemModel({
    required this.onTap,
    required this.title,
    required this.color,
    required this.icon,
  });
}
