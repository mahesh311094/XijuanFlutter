import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This widget for Chat Message
class MessageWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLeft;

  const MessageWidget({
    required this.child,
    required this.color,
    required this.isLeft,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.47,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft:
              isLeft ? const Radius.circular(4) : const Radius.circular(14),
          topRight: const Radius.circular(14),
          bottomLeft: const Radius.circular(14),
          bottomRight:
              isLeft ? const Radius.circular(14) : const Radius.circular(4),
        ),
      ),
      child: child,
    );
  }
}
