import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class InAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color bgColor;
  final void Function() onPressed;
  final double? paddingRight;
  final IconData? iconData;
  final Color? iconBgColor;
  final Color? iconFgColor;
  final OutlinedBorder? shape;
  const InAppBar({
    super.key,
    required this.title,
    required this.bgColor,
    required this.onPressed,
    this.paddingRight,
    this.iconData,
    this.iconBgColor,
    this.iconFgColor,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      title: Text(title),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: paddingRight ?? 12),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(iconData ?? Icons.menu),
            style: IconButton.styleFrom(
              backgroundColor: iconBgColor ?? AppColors.bgSecondaryColor,
              foregroundColor: iconFgColor ?? AppColors.bgColor,
              shape: shape ?? CircleBorder(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
