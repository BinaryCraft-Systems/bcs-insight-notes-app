import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:bcs_insight_notes/src/core/constants/app_media_querry.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/buttons/circular_tap_button.dart';
import 'package:flutter/material.dart';
// removed unused import: '../../constants/app_colors.dart'

class InAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String fontFamily;
  final Color bgColor;
  final void Function() onPressed;
  final double? paddingRight;
  final IconData? iconData;
  final Color? iconBgColor;
  final Color? iconFgColor;
  final OutlinedBorder? shape;
  final PreferredSizeWidget? bottom;
  const InAppBar({
    super.key,
    required this.title,
    required this.bgColor,
    required this.fontFamily,
    required this.onPressed,
    this.paddingRight,
    this.iconData,
    this.iconBgColor,
    this.iconFgColor,
    this.shape,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      centerTitle: false,
      titleSpacing: 5.0,
      title: Padding(
        padding: EdgeInsets.only(left: context.w * 0.03),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(fontFamily: fontFamily, fontSize: 24.0, color: AppColors.bgSecondaryColor),
          ),
        ),
      ),
      bottom: bottom,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: paddingRight ?? context.w * 0.03),
          child: CircularTapButton(
            onPressed: onPressed,
            iconData: iconData ?? Icons.menu,
            iconBgColor: iconBgColor,
            iconFgColor: iconFgColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
