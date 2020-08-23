import '../res/res.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

const String kFlutterDash =
    'https://skill-branch.ru/img/speakers/Adechenko.jpg';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            _buildItem(),
            Divider(
              thickness: 2,
              color: AppColors.mercury,
            )
          ],
        );
      },
    ));
  }

  Widget _buildItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Photo(photoLink: kFlutterDash),
        _buildPhotoMeta(),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('some text',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.h3.copyWith(color: AppColors.black)))
      ],
    );
  }

  Widget _buildPhotoMeta() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                UserAvatar(
                    'https://skill-branch.ru/img/speakers/Adechenko.jpg'),
                SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Text Text', style: AppStyles.h2Black),
                    Text('Text Text Text',
                        style: AppStyles.h5Black
                            .copyWith(color: AppColors.manatee))
                  ],
                )
              ],
            ),
            LikeButton(10, true),
          ],
        ));
  }
}
