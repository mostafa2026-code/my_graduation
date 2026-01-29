import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(SharedHelper.getThemeMode());

  void toggleTheme() {
    final newState = !state;
    SharedHelper.saveThemeMode(newState);
    emit(newState);
  }
}
