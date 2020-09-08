// import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import './feed_screen.dart';

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
      Photo(photoLink: kFlutterDash),
      Text(this.name == null ? '' : this.name),
      Text(this.userName == null ? '' : '@' + this.userName),
      Text(this.altDescription == null ? '' : this.altDescription),
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
