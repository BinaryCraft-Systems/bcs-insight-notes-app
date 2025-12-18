
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class InEndDrawer extends StatelessWidget {
  final Color? bgColor;
  final double? topLeftRadius;
  final double? bottomLeftRadius;
  const InEndDrawer({
    super.key,
    this.bgColor,
    this.topLeftRadius,
    this.bottomLeftRadius
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor ?? AppColors.bgSecondaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 24),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 24)
          )
      ),
      child: ListView(
        children: [
          Container(
            height: 72,
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              "MENU",
              style: TextStyle(
                fontSize: 24,
                letterSpacing: 2,
                color: AppColors.bgColor,
              ),
            ),
          ),
          Divider(
            thickness: 2,
            color: AppColors.bgColor,
          )
        ],
      ),
    );
  }
}
