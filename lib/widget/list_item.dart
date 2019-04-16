import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_source_china/contants/app_colors.dart';

class ListItemInfo extends StatefulWidget {
  final leftIcon;
  final title;
  final rightIcon;

  ListItemInfo(
      {Key key,
      @required this.leftIcon,
      @required this.title,
      @required this.rightIcon})
      : super(key: key);

  @override
  _ListItemInfoState createState() => _ListItemInfoState();
}

class _ListItemInfoState extends State<ListItemInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Icon(widget.leftIcon),
                SizedBox(
                  width: 15,
                ),
                Text(
                  widget.title,
                  style: TextStyle(color: AppColors.Text_Col,),
                ),
              ],
            ),
          ),
          Icon(widget.rightIcon),
        ],
      ),
    );
  }
}
