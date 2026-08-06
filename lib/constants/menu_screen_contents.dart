import 'package:daily_helper_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:daily_helper_app/models/menu_item_model.dart';

class MenuScreenContents {
  static const List<MenuItemModel> items = [
    MenuItemModel(
      title: "VAT Card",
      icon: Icons.credit_card,
      route: AppRoutes.vatcard,
    ),
    MenuItemModel(
      title: "Bank Records",
      icon: Icons.balance,
      route: AppRoutes.bankrecords,
    ),
  ];
}
