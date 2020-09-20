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
        duration: const Duration(milliseconds: 2000), vsync: this);
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
      UserAvatar(widget.userPhoto),
      Text(widget.name == null ? '' : widget.name),
      Text(widget.userName == null ? '' : '@' + widget.userName),
      Text(widget.altDescription == null ? '' : widget.altDescription),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: GestureDetector(
          child: Row(children: [
            MyButton('Save', () => debugPrint("Save")),
            MyButton('Visit', () => debugPrint("Visit")),
          ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
        ),
      )
    ]));
  }
}

class MyButton extends StatelessWidget {
  const MyButton(String text, Function onPress, {Key key})
      : this.text = text,
        this.onPress = onPress,
        super(key: key);

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: RaisedButton(
          onPressed: this.onPress,
          child: Text(this.text, style: TextStyle(fontSize: 15)),
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
