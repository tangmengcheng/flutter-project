import 'package:flutter/material.dart';
import 'package:trip/pages/home_page.dart';
import 'package:trip/pages/my_page.dart';
import 'package:trip/pages/search_page.dart';
import 'package:trip/pages/travel_page.dart';



class TabNavigator extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TabNavigatorState();

}

class _TabNavigatorState extends State<TabNavigator> {

  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _defaultColor,
          ),
          activeIcon: Icon(
            Icons.home,
            color: _activeColor,
          ),
          title: Text('首页', style: TextStyle(
            color: currentIndex != 0 ? _defaultColor : _activeColor
          ),)
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.search,
              color: _activeColor,
            ),
            title: Text('搜索', style: TextStyle(
                color: currentIndex != 1 ? _defaultColor : _activeColor
            ),)
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.camera_alt,
              color: _activeColor,
            ),
            title: Text('旅拍', style: TextStyle(
                color: currentIndex != 2 ? _defaultColor : _activeColor
            ),)
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.account_circle,
              color: _activeColor,
            ),
            title: Text('我的', style: TextStyle(
                color: currentIndex != 3 ? _defaultColor : _activeColor
            ),)
        )
      ],),
    );
  }
}