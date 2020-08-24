import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage(
      {String altDescription,
      String photoLink,
      String userName,
      String name,
      Key key})
      : this.photoLink = photoLink,
        this.altDescription = altDescription,
        this.userName = userName,
        this.name = name,
        super(key: key);

  final String photoLink;
  final String userName;
  final String name;
  final String altDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Photo(photoLink: this.photoLink),
      Text(this.name == null ? '' : this.name),
      Text(this.userName == null ? '' : '@' + this.userName),
      Text(this.altDescription == null ? '' : this.altDescription),
    ]));
  }
}

class AppBar extends StatefulWidget {
  AppBar({Key key}) : super(key: key);

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          IconButton(icon: AppIcons., onPressed: null)
        ],)
      ],
    );
  }
}
