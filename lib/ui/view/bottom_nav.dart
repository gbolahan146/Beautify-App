
import 'package:beautify/core/responsiveness.dart';
import 'package:beautify/ui/view/create/create.dart';
import 'package:beautify/ui/view/homepage/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void _bottomTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          // physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: <Widget>[
            HomeScreen(),
            Container(child: Center(child: Text('Wallet'))),
            ChartScreen(),
            Container(child: Center(child: Text('Settings'))),
          ],
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: CupertinoTabBar(
              onTap: _bottomTapped,
              currentIndex: _page,
              backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                _bottomNavigationBarItem(
                  "",
                  0,
                  Image.asset(
                    'assets/images/cardnav1.png',
                    height: McGyver.rsDoubleH(context, 3),
                    width: McGyver.rsDoubleW(context, 5),
                  ),
                  Image.asset(
                    'assets/images/cardnav1.png',
                    height: McGyver.rsDoubleH(context, 5),
                    width: McGyver.rsDoubleW(context, 7),
                  ),
                ),
                _bottomNavigationBarItem(
                  "",
                  1,
                  Image.asset(
                    'assets/images/cardnav2.png',
                    height: McGyver.rsDoubleH(context, 3),
                    width: McGyver.rsDoubleW(context, 5),
                  ),
                  Image.asset(
                    'assets/images/cardnav2.png',
                    height: McGyver.rsDoubleH(context, 5),
                    width: McGyver.rsDoubleW(context, 7),
                  ),

                ),
                _bottomNavigationBarItem(
                  "",
                  2,
                  Image.asset(
                    'assets/images/chart.png',
                    height: McGyver.rsDoubleH(context, 3),
                    width: McGyver.rsDoubleW(context, 5),
                  ),
                  Image.asset(
                    'assets/images/chart_n.png',
                    height: McGyver.rsDoubleH(context, 5),
                    width: McGyver.rsDoubleW(context, 7),
                  ),
                ),
                
                _bottomNavigationBarItem(
                  "",
                  3,
                  Image.asset(
                    'assets/images/settings.png',
                    height: McGyver.rsDoubleH(context, 3),
                    width: McGyver.rsDoubleW(context, 5),
                  ),
                  Image.asset(
                    'assets/images/settings.png',
                    height: McGyver.rsDoubleH(context, 5),
                    width: McGyver.rsDoubleW(context, 7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String label, int number, Widget icon, Widget activeIcon) {
    return BottomNavigationBarItem(
      activeIcon: activeIcon,
      icon: icon,
      
    );
  }
}
