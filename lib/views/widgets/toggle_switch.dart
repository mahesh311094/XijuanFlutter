import 'package:flutter/cupertino.dart';

import '../../utils/colors.dart';

// This widget for Toggle Switch
class ToggleSwitch extends StatelessWidget {
  final bool flag;
  final Function(bool) onChanged;

  const ToggleSwitch({
    super.key,
    required this.flag,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        value: flag,
        activeColor: primaryColor,
        trackColor: greyScale200Color,
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}
