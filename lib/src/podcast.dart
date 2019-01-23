import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podcast/src/pages/home_page.dart';

class Podcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Podcast',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.purpleAccent,
        disabledColor: Colors.grey,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
