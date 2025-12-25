import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:bcs_insight_notes/src/core/constants/app_fonts.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/buttons/in_elevated_button.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/buttons/in_outlined_button.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: AppColors.appBarBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Let\'s note your thoughts...',
                style: TextStyle(
                  fontFamily: AppFonts.oswald,
                  fontSize: 24,
                  color: AppColors.bgSecondaryColor,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  InElevatedButton(
                    label: 'All',
                    onPressed: () {},
                    backgroundColor: AppColors.bgSecondaryColor,
                    foregroundColor: AppColors.bgPrimaryColor,
                    fontSize: 16,
                    borderRadiusSize: 0,
                    fontFamily: AppFonts.oswald,
                  ),
                  const SizedBox(width: 8),
                  InOutlinedButton(label: 'Notes', onPressed: () {},),
                  const SizedBox(width: 8),
                  InOutlinedButton(label: 'List', onPressed: () {},),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Let\'s get started with Insight Notes!',
                  style: TextStyle(fontFamily: AppFonts.oswald, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
