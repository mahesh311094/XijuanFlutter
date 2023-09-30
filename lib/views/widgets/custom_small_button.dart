import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// This widget for Custom Small Button
class CustomSmallButton extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final Color bgColor;
  final VoidCallback? onPress;

  const CustomSmallButton({
    Key? key,
    required this.buttonText,
    required this.textColor,
    required this.bgColor,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
        side: const BorderSide(color: primaryColor, width: 2.0),
      ),
      onPressed: onPress,
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
