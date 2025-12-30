import 'package:bcs_insight_notes/src/core/constants/app_media_querry.dart';
import 'package:bcs_insight_notes/src/core/enums/note_types.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class NoteCard extends StatelessWidget {
  final NoteTypes noteType;
  final Color? bgColor;
  final Color? shadowColor;
  final Radius? radius;
  final double? blurRadius;
  final double? spreadRadius;
  final Offset? offset;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  const NoteCard({
    super.key,
    required this.noteType,
    this.bgColor,
    this.shadowColor,
    this.radius,
    this.blurRadius,
    this.spreadRadius,
    this.offset,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final size = noteType.size(context);
    final sdColor = shadowColor ?? AppColors.bgSecondaryColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: bgColor ?? AppColors.primarySelectionColor,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: sdColor.withValues(alpha: 0.1),
                blurRadius: blurRadius ?? 10,
                spreadRadius: spreadRadius ?? 2,
                offset: offset ?? Offset(0, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
