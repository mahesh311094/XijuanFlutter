import 'package:flutter/material.dart';

// This widget for custom button
class CustomButton extends StatelessWidget {
  final String buttonText;
  final double cornerRadius;
  final Color textColor;
  final Color bgColor;
  final Function()? onPress;

  const CustomButton({
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
      onPressed: () async{
        await onPress!();
      },
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
