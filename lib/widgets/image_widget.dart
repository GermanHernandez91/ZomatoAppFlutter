import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;

  ImageWidget({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Image.asset(
        "assets/images/placeholder.png",
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
