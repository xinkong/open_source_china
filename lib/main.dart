import 'package:flutter/material.dart';
import 'package:open_source_china/contants/app_colors.dart';
import 'package:open_source_china/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.AppTheme,
      ),
      home: HomePage(),
    );
  }
}

