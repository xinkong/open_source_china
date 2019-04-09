import 'package:flutter/material.dart';

class AboutPages extends StatefulWidget {
  @override
  _AboutPagesState createState() => _AboutPagesState();
}

class _AboutPagesState extends State<AboutPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
      ),
    );
  }
}
