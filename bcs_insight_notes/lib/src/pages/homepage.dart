import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:bcs_insight_notes/src/core/constants/app_fonts.dart';
import 'package:bcs_insight_notes/src/core/enums/note_types.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/buttons/in_outlined_button.dart';
// import 'package:bcs_insight_notes/src/core/shared_widgets/menu_bar/in_menu_bar.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/note_card/note_card.dart';
import 'package:flutter/material.dart';

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
                    label: 'Notes',
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Render rows of NoteCards with maximum 2 per row
                    Builder(builder: (context) {
                      final int rows = (noteCardCount + 1) ~/ 2;
                      return Column(
                        children: List.generate(rows, (r) {
                          final int firstIndex = r * 2;
                          final bool hasSecond = firstIndex + 1 < noteCardCount;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NoteCard(noteType: NoteTypes.note),
                              if (hasSecond) ...[
                                const SizedBox(width: 16),
                                NoteCard(noteType: NoteTypes.note),
                              ],
                            ],
                          );
                        }),
                      );
                    }),
                  ],
                ),
                // Text(
                //   'Let\'s get started with Insight Notes!',
                //   style: TextStyle(fontFamily: AppFonts.oswald, fontSize: 18),
                // ),
                // InMenuBar(icons: [Icons.note, Icons.check_box, Icons.mic]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
