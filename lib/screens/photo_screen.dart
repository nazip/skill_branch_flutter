// import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/claim_bottom_sheet.dart';
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
                        return ClaimBottomSheet();
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
        child: Row(children: [
          // MyButton('Save', () => Navigator.pop(context)),

          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text("download photos"),
                  content:
                      new Text("Are you sure you want to download a photo?"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Download"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ),
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text("Save"),
            ),
          ),
          MyButton('Cancel', () => Navigator.pop(context)),
        ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
      )
    ]));
  }
}
