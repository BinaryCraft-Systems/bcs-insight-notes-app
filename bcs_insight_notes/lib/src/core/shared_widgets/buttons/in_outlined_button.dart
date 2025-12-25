import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
StatefulWidget InOutlinedButton({
  required String label,
  required void Function() onPressed,
  Color? foregroundColor,
  double? fontSize,
  double? borderRadiusSize,
  double? borderWidth,
  String? fontFamily,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      foregroundColor: foregroundColor ?? AppColors.bgSecondaryColor,
      textStyle: TextStyle(
        fontSize: fontSize ?? 16,
        fontFamily: fontFamily ?? 'Oswald',
      ),
      side: BorderSide(color: AppColors.bgSecondaryColor, width: borderWidth ?? 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusSize ?? 0),
      ),
    ),
    child: Text(label),
  );
}
