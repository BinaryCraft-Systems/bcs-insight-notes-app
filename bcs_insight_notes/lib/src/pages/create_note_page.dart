import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:bcs_insight_notes/src/core/constants/app_fonts.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/app_bar/in_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/navigation/navigation_cubit.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  @override
  Widget build(BuildContext context) {
    final int? selectedIndex = context.read<NavigationCubit>().selectedNoteIndex;
    return Scaffold(
      appBar: InAppBar(
          title: "Create Note",
          bgColor: AppColors.appBarBackgroundColor,
          fontFamily: AppFonts.anton,
          iconData: Icons.arrow_back_sharp,
          onPressed: () {
            context.read<NavigationCubit>().goHome();
          }
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          selectedIndex != null ? 'Note index: $selectedIndex' : 'Create new note',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
