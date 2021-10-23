import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodlogin/page/food/food.dart';
import 'package:foodlogin/page/profile.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  List<String> titleName = ["Food", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titleName[_subPageIndex], style: TextStyle(color: Colors.white),),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [
                      0.4,
                      0.8,
                      1.0
                    ],
                    colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade800,
                      Colors.blue.shade700
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          child: Image.asset('assets/images/pro.png'),
                        )),
                    Text("Phattaranit Bamrungmuang",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text("phattaranit.pp@gmail.com",
                        style: TextStyle(color: Colors.white70, fontSize: 14))
                  ],
                ),
              ),
              _buildDrawerItem(Icons.fastfood, "Food", 0),
              _buildDrawerItem(Icons.person, "Profile", 1),
            ],
          ),
        ),
        body: _buildSubPage()
    );
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0: // home page
        return FoodPage();
      case 1:
        return ProfilePage();
      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildDrawerItem(IconData icon, String title,int index) {
    return ListTile(
      leading: Icon(icon),
      title: Align(
        alignment: Alignment(-1.3, 0),
        child: Text(
          title,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      selected: index == _subPageIndex,
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          _subPageIndex = index;
        });
      },
    );
  }
}