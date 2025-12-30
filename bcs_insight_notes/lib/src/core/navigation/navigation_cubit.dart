import 'package:flutter_bloc/flutter_bloc.dart';
import '../enums/navigation_page.dart';

class NavigationCubit extends Cubit<NavigationPage> {
  NavigationCubit() : super(NavigationPage.home);

  void goHome() => emit(NavigationPage.home);
  void goToCreateNote() => emit(NavigationPage.createNote);

}