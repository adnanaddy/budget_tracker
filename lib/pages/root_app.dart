import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_tracker/pages/daily_page.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: getBody()),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 25.0),
        onPressed: () {
          setTabs(4);
        },
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DailyPage(),
        Center(child: Text("Stats Page")),
        Center(child: Text("Budget Page")),
        Center(child: Text("Profile Page")),
        Center(child: Text("Create Budget Page")),
      ],
    );
  }


  Widget getFooter() {
    List<IconData> iconItems = [
      FlutterIcons.calendar_ant,
      FlutterIcons.line_graph_ent,
      FlutterIcons.wallet_sli,
      FlutterIcons.user_circle_faw5
    ];
    return AnimatedBottomNavigationBar(
      icons: iconItems,
      activeColor: primary,
      splashRadius:35,
      splashColor: secondary,
      inactiveColor: black.withOpacity(0.5),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      iconSize: 25,
      activeIndex: pageIndex,
      onTap: (index){
        setTabs(index);
      },
    );
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
