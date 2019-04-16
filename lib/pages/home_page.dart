import 'package:flutter/material.dart';
import 'package:open_source_china/contants/app_colors.dart';
import 'package:open_source_china/pages/find_pages.dart';
import 'package:open_source_china/pages/mine_page.dart';
import 'package:open_source_china/pages/new_pages.dart';
import 'package:open_source_china/pages/tweet_pages.dart';
import 'package:open_source_china/widget/bottom_navigation_item.dart';
import 'package:open_source_china/widget/my_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appBarTitle = ["资讯", "动谈", "发现", "我的"];
  var _currentIndex = 0;
  List<BottomNavigationView> items;

  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    items = [
      BottomNavigationView(
          title: _appBarTitle[0],
          iconPath: "assets/images/ic_nav_news_normal.png",
          activeIconPath: "assets/images/ic_nav_news_actived.png"),
      BottomNavigationView(
          title: _appBarTitle[1],
          iconPath: "assets/images/ic_nav_tweet_normal.png",
          activeIconPath: "assets/images/ic_nav_tweet_actived.png"),
      BottomNavigationView(
          title: _appBarTitle[2],
          iconPath: "assets/images/ic_nav_discover_normal.png",
          activeIconPath: "assets/images/ic_nav_discover_actived.png"),
      BottomNavigationView(
          title: _appBarTitle[3],
          iconPath: "assets/images/ic_nav_my_normal.png",
          activeIconPath: "assets/images/ic_nav_my_pressed.png"),
    ];

    _pages = [NewPages(), TweetPages(), FindPages(), MinePages()];

    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _appBarTitle[_currentIndex],
            style: TextStyle(color: AppColors.Colfff, fontSize: 20),
          ),
        ),
        body: PageView.builder(
//        physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _pages[index];
          },
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: items.map((view) => view.item).toList(),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(index,
                  duration: Duration(microseconds: 1), curve: Curves.ease);
            });
          },
        ),
        drawer: MyDrawer(
            headPicPath: 'assets/images/cover_img.jpg',
            title:  ['发布动弹', '动弹小黑屋', '关于', '设置','动画爱心'],
            icons: [Icons.send, Icons.home, Icons.error, Icons.settings,Icons.star],));
  }
}
