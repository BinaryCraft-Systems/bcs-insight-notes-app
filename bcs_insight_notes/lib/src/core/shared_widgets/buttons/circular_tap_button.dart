import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CircularTapButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData? iconData;
  final Color? iconBgColor;
  final Color? iconFgColor;
  const CircularTapButton({
    super.key,
    required this.onPressed,
    this.iconData,
    this.iconBgColor,
    this.iconFgColor
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(iconData),
      style: IconButton.styleFrom(
        backgroundColor: iconBgColor ?? AppColors.bgSecondaryColor,
        foregroundColor: iconFgColor ?? AppColors.bgColor,
        shape: CircleBorder(),
      ),
    );
  }
}
