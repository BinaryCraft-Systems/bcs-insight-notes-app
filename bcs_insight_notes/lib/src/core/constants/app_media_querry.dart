
import 'package:bcs_insight_notes/src/core/enums/note_types.dart';
import 'package:flutter/material.dart';


extension AppMediaQurry on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get w => screenSize.width;
  double get h => screenSize.height;
}

extension NoteTypeSize on NoteTypes {
  Size size(BuildContext context){
    final w = context.w;

    switch(this){
      case NoteTypes.note :
        return Size(w * 0.4, w * 0.4);
      case NoteTypes.todo :
        return Size(w * 0.4, w * 0.6);
      case NoteTypes.voice :
        return Size(w * 0.4, w * 0.2);
    }
  }
}