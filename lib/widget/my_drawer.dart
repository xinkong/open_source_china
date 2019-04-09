import 'package:flutter/material.dart';
import 'package:open_source_china/pages/drawer/about_page.dart';
import 'package:open_source_china/pages/drawer/send_tweet_page.dart';
import 'package:open_source_china/pages/drawer/setting_page.dart';
import 'package:open_source_china/pages/drawer/tweet_bleak_hose_page.dart';

class MyDrawer extends StatelessWidget {
  final headPicPath;
  final List title;
  final List icons;

  MyDrawer({@required this.headPicPath, @required this.title, @required this.icons});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
          itemBuilder: (contenx, index) {
            if (index == 0) {
              return Image.asset(
                headPicPath,
                fit: BoxFit.cover,
              );
            }
            index -= 1;
            return ListTile(
              leading: Icon(icons[index]),
              title: Text(title[index]),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                switch (index) {
                  case 0:
                  //PublishTweetPage
                    _navPush(context, SendTweetPages());
                    break;
                  case 1:
                  //TweetBlackHousePage
                    _navPush(context, TweetBleakHosePages());
                    break;
                  case 2:
                  //AboutPage
                    _navPush(context, AboutPages());
                    break;
                  case 3:
                  //SettingsPage
                    _navPush(context, SettingPages());
                    break;
                }
              },

            );
          },
          separatorBuilder: (contenxt,index){
            if (index == 0) {
              return Divider(
                height: 0.0,
              );
            } else {
              return Divider(
                height: 1.0,
              );
            }
          },
          itemCount: title.length + 1),
    );
  }

  _navPush(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
