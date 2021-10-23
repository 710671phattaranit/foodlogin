import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodlogin/page/plat.dart';
import 'package:foodlogin/page/food/newfood_main.dart';
import 'package:foodlogin/page/profile.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedDrawerItemIndex = 0;

  final _pageDataList = [
    {
      'icon': Icons.fastfood,
      'title': 'Food',
      'page': FoodMainPage(),
    },
    {
      'icon': Icons.person,
      'title': 'Profile',
      'page': ProfilePage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDataList[_selectedDrawerItemIndex]['title'] as String),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.background,
                  ],
                ),
                //color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: PlatformAwareAssetImage(
                          assetPath: 'assets/images/pro.png',
                        ),
                      )
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Phattaranit Bamrungmuang',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'phattaranit.pp@gmail.com',
                    style: TextStyle(
                        fontSize: 14.0, color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
            for (var item in _pageDataList)
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      color: item == _pageDataList[_selectedDrawerItemIndex]
                          ? Theme.of(context).accentColor
                          : null,
                    ),
                    SizedBox(width: 8.0),
                    Text(item['title'] as String),
                  ],
                ),
                onTap: () {
                  setState(() {
                    _selectedDrawerItemIndex =
                        _pageDataList.indexWhere((element) => item == element);
                  });
                  Navigator.of(context).pop();
                },
                selected: item == _pageDataList[_selectedDrawerItemIndex],
              ),
          ],
        ),
      ),
      body: Container(
        child: _pageDataList[_selectedDrawerItemIndex]['page'] as Widget,
      ),
    );
  }
}