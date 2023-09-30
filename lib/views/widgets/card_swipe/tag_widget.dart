import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors.dart';

class TagWidget extends StatelessWidget {
  final String iconPath;
  final LinearGradient gradient;

  const TagWidget({
    Key? key,
    required this.iconPath,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 4),
      child: Container(
        decoration: ShapeDecoration(
          gradient: gradient,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        child: Center(
          child: FloatingActionButton(
            backgroundColor: whiteColor,
            onPressed: () {},
            child: iconPath.contains(".png")
                ? Image.asset(
                    iconPath,
                    height: 24,
                  )
                : SvgPicture.asset(
                    iconPath,
                    height: 20,
                  ),
          ),
        ),
      ),
    );
  }
}
