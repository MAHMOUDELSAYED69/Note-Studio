import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_studio/controllers/theme_cubit/theme_cubit.dart';
import 'package:note_studio/utils/extentions/extentions.dart';
import 'package:note_studio/view/widgets/my_app_bar_action_button.dart';
import '../../utils/cache/cache.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        bool isDarkMode = CacheData.get(key: 'isDarkMode') ?? false;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: AppBarActionButton(
            key: ValueKey<bool>(isDarkMode), // Key to differentiate widgets
            iconData: isDarkMode ? Icons.light_mode : Icons.dark_mode,
            onTap: () => context.cubit<ThemeCubit>().toggleTheme(),
          ),
        );
      },
    );
  }
}
