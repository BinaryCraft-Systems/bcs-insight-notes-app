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

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  int noteCardCount = 4;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  late TextEditingController _searchController;
  late FocusNode _searchFocusNode;
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content column: filter buttons + grid
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
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
                      onTap: () => context
                          .read<NavigationCubit>()
                          .goToCreateNote(index: index),
                    );
                  },
                ),
              ),
            ), // end last child of Column
          ],
        ),

        // Bottom bar: SafeArea full-width with search field and FAB aligned space-between
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(color: Colors.white24),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 4)),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        onTap: () => FocusScope.of(context).requestFocus(_searchFocusNode),
                        keyboardType: TextInputType.text,
                        showCursor: true,
                        readOnly: false,
                        style: const TextStyle(color: AppColors.searchTextColor, fontFamily: AppFonts.oswald),
                        cursorColor: AppColors.searchTextColor,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search, color: AppColors.searchIconColor, size: 25),
                          hintText: 'Search here...',
                          hintStyle: TextStyle(color: AppColors.searchPlaceholderColor),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 11.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // FAB with expandable buttons, allowed room to animate upward
                  AnimatedBuilder(
                    animation: _expandAnimation,
                    builder: (context, child) {
                      return SizedBox(
                        width: 56,
                        height: 200,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            for (int i = 0; i < 3; i++)
                              Transform.translate(
                                offset: Offset(0, -((i + 1) * 70.0 * _expandAnimation.value)),
                                child: Opacity(
                                  opacity: _expandAnimation.value,
                                  child: Material(
                                    color: Colors.black,
                                    shape: const CircleBorder(),
                                    elevation: 4,
                                    child: InkWell(
                                      onTap: () {
                                        if (i == 0) {
                                          context.read<NavigationCubit>().goToCreateNote(index: 0);
                                        } else if (i == 1) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('List tapped')),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Other tapped')),
                                          );
                                        }
                                      },
                                      customBorder: const CircleBorder(),
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Icon(
                                          i == 0 ? Icons.note_add : (i == 1 ? Icons.list : Icons.edit_note),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            FloatingActionButton(
                              backgroundColor: Colors.black,
                              onPressed: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                  if (_isExpanded) {
                                    _controller.forward();
                                  } else {
                                    _controller.reverse();
                                  }
                                });
                              },
                              child: Transform.rotate(
                                angle: _expandAnimation.value * 0.5 * 3.14159,
                                child: const Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }
}
