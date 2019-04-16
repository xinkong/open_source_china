import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_source_china/contants/app_colors.dart';
import 'package:open_source_china/contants/app_url_info.dart';
import 'package:open_source_china/contants/event_bus.dart';
import 'package:open_source_china/pages/LoginPage.dart';
import 'package:open_source_china/utils/data_utils.dart';
import 'package:open_source_china/utils/net_utils.dart';
import 'package:open_source_china/widget/list_item.dart';

class MinePages extends StatefulWidget {
  @override
  _MinePagesState createState() => _MinePagesState();
}

class _MinePagesState extends State<MinePages> {
  List<String> title = [
    "我的消息",
    "阅读记录",
    "我的博客",
    "我的问答",
    "我的活动",
    "我的团队",
    "邀请好友",
  ];
  List iconInfo = [
    Icons.star,
    Icons.add,
    Icons.print,
    Icons.dashboard,
    Icons.radio,
    Icons.dashboard,
    Icons.wallpaper,
  ];

  var userAvatar;
  var userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventBus.on<LoginEvent>().listen((_) {
      print("收到通知");
      _getUserInfo();
    });
  }

  _getUserInfo() {
    DataUtils.getAccessToken().then((accessToken) {
      if (accessToken == null || accessToken.length == 0) {
        return;
      }

      Map<String, dynamic> params = Map<String, dynamic>();
      params['access_token'] = accessToken;
      params['dataType'] = 'json';
      print('accessToken: $accessToken');
      NetUtils.get(AppUrls.OPENAPI_USER, params).then((data) {
        print('data: $data');
        Map<String, dynamic> map = json.decode(data);
        if (mounted) {
          setState(() {
            userAvatar = map['avatar'];
            userName = map['name'];
          });
        }
        DataUtils.saveUserInfo(map);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              if (index == 0) {
                return createHeadView();
              }
              index -= 1;
              return InkWell(
                onTap: () {
                  print(title[index]);
                },
                child: ListItemInfo(
                    leftIcon: iconInfo[index],
                    title: title[index],
                    rightIcon: Icons.arrow_forward_ios),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: title.length + 1),
      ),
    );
  }

  void jumpToLgoin() async {
    var result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LogingPage()));
    print("登录页面返回了"+result);
  }

  Widget createHeadView() {
    return Container(
      padding: EdgeInsets.only(top: 60, bottom: 60),
      color: AppColors.AppTheme,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (userAvatar == null) {
                jumpToLgoin();
              }
            },
            child: userAvatar == null
                ? Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: AppColors.Colfff),
                      image: DecorationImage(
                          image: AssetImage("assets/images/default_head.png"),
                          fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: AppColors.Colfff),
                      image: DecorationImage(
                          image: NetworkImage(userAvatar),
                          fit: BoxFit.cover),
                    ),
                  ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            userName ??= "点击头像登录",
            style: TextStyle(color: AppColors.Colfff),
          )
        ],
      ),
    );
  }
}
