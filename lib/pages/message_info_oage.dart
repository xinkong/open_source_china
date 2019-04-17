import 'package:flutter/material.dart';
import 'package:open_source_china/contants/app_colors.dart';

class MessageInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MessageContent();
  }
}

class MessageContent extends StatefulWidget {
  @override
  _MessageContentState createState() => _MessageContentState();
}

class _MessageContentState extends State<MessageContent> {
  List<String> _TableTile = ["@我", "评论", "私信"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _TableTile.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "我的消息",
            style: TextStyle(color: AppColors.Colfff),
          ),
          iconTheme: IconThemeData(color: AppColors.Colfff),
          bottom: TabBar(
              tabs: _TableTile.map((title) => Tab(
                    child: Text(title),
                  )).toList()),
        ),
        body: TabBarView(children: [
          Center(
            child: Text("@我"),
          ),
          Center(
            child: Text("评论"),
          ),
          Center(
            child: Text("私信"),
          ),
        ]),
      ),
    );
  }
}
