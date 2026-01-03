import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:bcs_insight_notes/src/core/constants/app_fonts.dart';
import 'package:bcs_insight_notes/src/core/enums/note_types.dart';
import 'package:bcs_insight_notes/src/core/navigation/navigation_cubit.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/buttons/in_outlined_button.dart';
// import 'package:bcs_insight_notes/src/core/shared_widgets/menu_bar/in_menu_bar.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/note_card/note_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  int noteCardCount = 4;
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
                  InOutlinedButton(
                    label: 'All',
                    isSelected: _selectedIndex == 0,
                    onPressed: () => setState(() => _selectedIndex = 0),
                  ),
                  const SizedBox(width: 8),
                  InOutlinedButton(
                    label: 'Notes',
                    isSelected: _selectedIndex == 1,
                    onPressed: () => setState(() => _selectedIndex = 1),
                  ),
                  const SizedBox(width: 8),
                  InOutlinedButton(
                    label: 'List',
                    isSelected: _selectedIndex == 2,
                    onPressed: () => setState(() => _selectedIndex = 2),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
              itemCount: noteCardCount,
              itemBuilder: (context, index) {
                return NoteCard(
                  noteType: NoteTypes.note,
                  onTap: () => context.read<NavigationCubit>().goToCreateNote(index: index),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
