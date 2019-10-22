import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/src/pages/browse.dart';
import 'package:podcast/src/pages/library.dart';
import 'package:podcast/src/pages/listen_now.dart';
import 'package:podcast/src/pages/search.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController = PageController();
  StreamController pageStream = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: PageView(
        controller: pageController,
        children: <Widget>[
          ListenNowPage(),
          LibraryPage(),
          BrowsePage(),
          SearchPage(),
        ],
        physics: new NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: pageStream.stream,
        builder: (_, snapshot) => CupertinoTabBar(
          backgroundColor: Colors.white,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).disabledColor,
          iconSize: 28.0,
          onTap: (value) {
            pageStream.sink.add(value);
            pageController.jumpToPage(value);
          },
          currentIndex: snapshot.data ?? 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_filled),
              title: Text('Listen Now'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              title: Text('Library'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wifi_tethering),
              title: Text('Browse'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              title: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageStream.close();
  }
}
