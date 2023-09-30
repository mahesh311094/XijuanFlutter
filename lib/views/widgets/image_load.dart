import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// This widget for Image load in SVG or PNG or other format
class ImageLoad extends StatelessWidget {
  final String imagePath;

  const ImageLoad({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imagePath.contains(".svg")
        ? SvgPicture.network(
            imagePath,
            placeholderBuilder: (context) {
              return Container();
            },
            width: 30.0,
          )
        : Image.network(
            imagePath,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Container();
            },
            width: 30.0,
          );
  }
}
