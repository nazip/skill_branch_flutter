// import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import './feed_screen.dart';

class FullScreenImage extends StatefulWidget {
  FullScreenImage(
      {String altDescription,
      String photo,
      String userName,
      String name,
      String heroTag,
      String userPhoto,
      Key key})
      : this.photoLink = photo,
        this.altDescription = altDescription,
        this.userName = userName,
        this.name = name,
        this.heroTag = heroTag,
        this.userPhoto = userPhoto,
        super(key: key);

  final String photoLink;
  final String userName;
  final String name;
  final String altDescription;
  final String heroTag;
  final String userPhoto;

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                // icon: Icon(Icons.chevron_left),
                icon: Icon(CupertinoIcons.back),
                tooltip: 'back',
                onPressed: () {
                  Navigator.pop(context);
                });
          }),
          title: Text('Photo')),
      Hero(tag: widget.heroTag, child: Photo(photoLink: kFlutterDash)),
      Row(children: <Widget>[
        UserAvatar(widget.userPhoto),
        SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.name == null ? '' : widget.name),
            Text(widget.userName == null ? '' : '@' + widget.userName),
            Text(widget.altDescription == null ? '' : widget.altDescription)
          ],
        )
      ])
    ]));
  }
}
