import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
OutlinedButton InOutlinedButton({
  required String label,
  required bool isSelected,
  required void Function() onPressed,
  Color? foregroundColor,
  Color? backgroundColor,
  double? fontSize,
  double? borderRadiusSize,
  double? borderWidth,
  String? fontFamily,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      foregroundColor: isSelected ? foregroundColor ?? AppColors.bgPrimaryColor : AppColors.bgSecondaryColor,
      backgroundColor: isSelected
          ? backgroundColor ?? AppColors.bgSecondaryColor
          : AppColors.buttonTransparentColor,
      textStyle: TextStyle(
        fontSize: fontSize ?? 16,
        fontFamily: fontFamily ?? 'Oswald',
      ),
      side: BorderSide(
        color: AppColors.bgSecondaryColor,
        width: borderWidth ?? 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusSize ?? 0),
      ),
    ),
    child: Text(label),
  );
}
