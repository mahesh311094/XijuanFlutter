import 'package:flutter/material.dart';

// This widget for gradient circle avatar
class GradientCircleAvatar extends StatelessWidget {
  final LinearGradient linearGradient;
  final Widget child;

  const GradientCircleAvatar(
      {super.key, required this.linearGradient, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: linearGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
