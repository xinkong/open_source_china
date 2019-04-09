import 'package:flutter/material.dart';

class SettingPages extends StatefulWidget {
  @override
  _SettingPagesState createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
    );
  }
}
