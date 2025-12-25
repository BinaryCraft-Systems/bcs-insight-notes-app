import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
StatefulWidget InElevatedButton({
  required String label,
  required void Function() onPressed,
  String? fontFamily,
  Color? backgroundColor,
  Color? foregroundColor,
  double? fontSize,
  double? borderRadiusSize,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.bgSecondaryColor,
      foregroundColor: foregroundColor ?? AppColors.bgPrimaryColor,
      textStyle: TextStyle(
        fontSize: fontSize ?? 16,
        fontFamily: fontFamily ?? 'Oswald',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusSize ?? 0),
      ),
    ),
    child: Text(label),
  );
}