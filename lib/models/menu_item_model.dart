import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final IconData icon;
  final String route;

  const MenuItemModel({
    required this.title,
    required this.icon,
    required this.route,
  });
}
