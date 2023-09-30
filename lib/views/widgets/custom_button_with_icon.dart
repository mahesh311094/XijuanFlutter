import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';

// This widget for Custom Button With Icon
class CustomButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final double cornerRadius;
  final Color textColor;
  final Color bgColor;
  final VoidCallback? onPress;

  const CustomButtonWithIcon({
    Key? key,
    required this.buttonText,
    required this.cornerRadius,
    required this.textColor,
    required this.bgColor,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48.0,
      elevation: 0,
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      onPressed: onPress,
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/camera.svg',
            colorFilter: const ColorFilter.mode(
              whiteColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 6.0),
          Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
