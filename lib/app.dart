// import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:flutter/material.dart';

import 'res/res.dart';
import 'screens/feed_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: buildAppTextTheme(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: buildAppTextTheme(),
      ),
      home: Feed(),
    );
  }
}
