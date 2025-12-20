import 'package:bcs_insight_notes/src/assets/icons/app_icons.dart';
import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../constants/app_media_querry.dart';

class InSearchBar extends StatelessWidget {
  final TextEditingController? textEditingController;
  final double? width;
  const InSearchBar({
    super.key,
    this.width,
    this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w * 0.8,
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColors.bgSecondaryColor.withValues(alpha: 0.25),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: "Search here",
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          prefixIcon: Icon(AppIcons.searchIcon),
        ),
      ),
    );
  }
}
