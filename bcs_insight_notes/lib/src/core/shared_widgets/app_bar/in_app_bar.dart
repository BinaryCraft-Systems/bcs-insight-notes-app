import 'package:bcs_insight_notes/src/core/constants/app_media_querry.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/buttons/circular_tap_button.dart';
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
          padding: EdgeInsets.only(right: paddingRight ?? context.w * 0.03),
          child: CircularTapButton(
          onPressed: onPressed,
            iconData: iconData,
            iconBgColor: iconBgColor,
            iconFgColor: iconFgColor,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
