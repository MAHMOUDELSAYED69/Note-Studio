import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/theme_cubit/theme_cubit.dart';
import '../router/app_router.dart';
import '../utils/constants/routes.dart';
import '../utils/themes/app_theme.dart';
import 'controllers/notes_cubit/notes_cubit.dart';
import 'data/repository/note_repo.dart';
import 'data/sql/sql.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      NotesCubit(NotesRepository(SqlDatabase()))..fetchNotes(),
                ),
                BlocProvider(
                  create: (context) => ThemeCubit(),
                ),
              ],
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return MaterialApp(
                    builder: (context, widget) {
                      final mediaQueryData = MediaQuery.of(context);
                      final scaledMediaQueryData = mediaQueryData.copyWith(
                        textScaler: TextScaler.noScaling,
                      );
                      return MediaQuery(
                        data: scaledMediaQueryData,
                        child: widget!,
                      );
                    },
                    title: 'Note Studio',
                    theme: state == ThemeState.dark
                        ? AppTheme.darkTheme
                        : AppTheme.lightTheme,
                    debugShowCheckedModeBanner: false,
                    initialRoute: RouteManager.initialRoute,
                    onGenerateRoute: AppRouter.onGenerateRoute,
                  );
                },
              ),
            ));
  }
}
