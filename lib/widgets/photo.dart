import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Photo extends StatelessWidget {
  const Photo({String photoLink, Key key})
      : this.photoLink = photoLink != null ? photoLink : '',
        super(key: key);

  final String photoLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(17)),
        child: CachedNetworkImage(
          imageUrl: photoLink,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
