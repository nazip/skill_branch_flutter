import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import './feed_screen.dart';

// const String kFlutterDash =
//     'https://skill-branch.ru/img/speakers/Adechenko.jpg';

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
      GestureDetector(
        child: Row(children: [
          Container(
            child: Text('Save'),
            decoration: BoxDecoration(
                color: AppColors.manatee,
                borderRadius: BorderRadius.circular(12)),
          ),
          Container(
            child: Text('Visit'),
            decoration: BoxDecoration(
                color: AppColors.manatee,
                borderRadius: BorderRadius.circular(12)),
          ),
        ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
      )
    ]));
  }
}

// class AppBar extends StatefulWidget {
//   AppBar({this.title, this.leading, Key key}) : super(key: key);

//   final String title;
//   final String leading;

//   @override
//   _AppBarState createState() => _AppBarState();
// }

// class _AppBarState extends State<AppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(children: [
//           IconButton(icon: Icon(Icons.chevron_left), onPressed: null)
//         ],)
//       ],
//     );
//   }
// }
