import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:bcs_insight_notes/src/core/constants/app_fonts.dart';
import 'package:bcs_insight_notes/src/core/constants/app_media_querry.dart';
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
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    final int? selectedIndex = context.read<NavigationCubit>().selectedNoteIndex;
   _textEditingController = TextEditingController();
    _textEditingController.text = selectedIndex != null ? selectedIndex.toString() : "";
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InAppBar(
          title: "Create Note",
          bgColor: AppColors.appBarBackgroundColor,
          fontFamily: AppFonts.anton,
          iconData: Icons.arrow_back_sharp,
          onPressed: () => context.read<NavigationCubit>().goHome(),
      ),
      backgroundColor: AppColors.bgPrimaryColor,
      body: Center(
        child: Container(
          width: context.w * 0.9,
          height: context.h * 0.8,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25)
          ),
          child: TextField(
            controller: _textEditingController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20)
            ),
          ),
        ),
      ),
    );
  }
}
