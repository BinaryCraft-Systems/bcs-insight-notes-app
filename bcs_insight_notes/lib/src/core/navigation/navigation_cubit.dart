import 'package:flutter_bloc/flutter_bloc.dart';
import '../enums/navigation_page.dart';

class NavigationCubit extends Cubit<NavigationPage> {
  NavigationCubit() : super(NavigationPage.home);

  int? selectedNoteIndex;

  void goHome() {
    selectedNoteIndex = null;
    emit(NavigationPage.home);
  }

  void goToCreateNote({int? index}) {
    selectedNoteIndex = index;
    emit(NavigationPage.createNote);
  }

}