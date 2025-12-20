import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isSelected;
  const FilterButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: AppColors.bgSecondaryColor.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(25),
      color: isSelected ? AppColors.primarySelectionColor : AppColors.bgColor,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(
            isSelected ? AppColors.bgColor : AppColors.bgSecondaryColor,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
