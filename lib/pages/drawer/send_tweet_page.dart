import 'package:flutter/material.dart';

class SendTweetPages extends StatefulWidget {
  @override
  _SendTweetPagesState createState() => _SendTweetPagesState();
}

class _SendTweetPagesState extends State<SendTweetPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布动谈'),
      ),
    );
  }
}
