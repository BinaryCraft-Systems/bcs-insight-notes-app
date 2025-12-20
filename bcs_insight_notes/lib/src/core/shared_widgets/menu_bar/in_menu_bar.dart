import 'package:bcs_insight_notes/src/core/shared_widgets/buttons/circular_tap_button.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class InMenuBar extends StatelessWidget {
  final List<IconData> icons;
  const InMenuBar({
    super.key,
    required this.icons}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.bgSecondaryColor,
          borderRadius: BorderRadius.circular(25)
      ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(icons.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: CircularTapButton(
                iconData: icons[index],
                onPressed: () {},
              ),
            );
          }),
        ),
    );
  }
}
