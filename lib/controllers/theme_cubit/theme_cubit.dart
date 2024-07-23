import 'package:bloc/bloc.dart';

import '../../utils/cache/cache.dart';

enum ThemeState { dark, light }

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(CacheData.get(key: 'isDarkMode') ?? false
            ? ThemeState.light
            : ThemeState.dark);
  Future<void> toggleTheme() async {
    final newTheme =
        state == ThemeState.dark ? ThemeState.light : ThemeState.dark;
    await CacheData.set(key: 'isDarkMode', value: newTheme == ThemeState.light);

    emit(newTheme);
  }
}
