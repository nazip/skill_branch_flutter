// import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import './feed_screen.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage(
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
        title: Text('Photo'),
        actions: [
          Builder(
              builder: (context) => IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    Scaffold.of(context).showBottomSheet<void>(
                      (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.amber,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                MyButton('ADULT', () => Navigator.pop(context)),
                                MyButton('SPAM', () => Navigator.pop(context)),
                                MyButton('HATE', () => Navigator.pop(context)),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  })),
        ],
      ),
      Hero(tag: heroTag, child: Photo(photoLink: kFlutterDash)),
      Text(this.name == null ? '' : this.name),
      Text(this.userName == null ? '' : '@' + this.userName),
      Text(this.altDescription == null ? '' : this.altDescription),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: GestureDetector(
          child: Row(children: [
            MyButton(
                'Save',
                () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("title"),
                          content: new Text("Alert Dialog body"),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            new FlatButton(
                              child: new Text("Download"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    )),
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
