import 'package:flutter/material.dart';

class BottomNavigationView {
  final title; //文字描述

  final iconPath; //icon路径

  final activeIconPath; //激活路径

  final BottomNavigationBarItem item;

  BottomNavigationView(
      {@required this.title,
      @required this.iconPath,
      @required this.activeIconPath})
      : item = BottomNavigationBarItem(
            icon: Image.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
              activeIconPath,
              width: 20,
              height: 20,
            ),
            title: Text(title,));
}
