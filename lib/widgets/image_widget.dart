import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  ImageWidget({@required this.imageUrl, this.width = 160, this.height = 160});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: 160,
      height: 160,
      placeholder: (context, url) => Image.asset(
        "assets/images/placeholder.png",
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
