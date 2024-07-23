import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/routes.dart';
import '../../data/model/note_model.dart';
import '../../utils/extentions/extentions.dart';
import '../../view/widgets/empty_search_body.dart';

class NotesSearchDelegate extends SearchDelegate<String> {
  final List<Note> notes;

  NotesSearchDelegate({required this.notes});

  late TextStyle themeTextStyle;
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    themeTextStyle = context.textTheme.bodyMedium!;
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: context.appBarTheme.backgroundColor?.withOpacity(0.1),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: context.textTheme.bodyMedium,
        border: InputBorder.none,
      ),
    );
  }

  @override
  TextStyle? get searchFieldStyle {
    return themeTextStyle;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: context.iconTheme.color,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.arrow_back,
        color: context.iconTheme.color,
      ),
      onTap: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = notes
        .where((note) => note.title.contains(query.toLowerCase()))
        .toList();
    return results.isEmpty
        ? const Center(child: BuildEmptySearchbody())
        : ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(results[index].title,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontSize: 26.sp)),
                onTap: () {
                  log(results[index].title);
                  close(context, results[index].title);
                },
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = notes
        .where((note) => note.title.contains(query.toLowerCase()))
        .toList();
    return suggestions.isEmpty
        ? const Center(child: BuildEmptySearchbody())
        : ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  suggestions[index].title,
                  style:
                      context.textTheme.bodyMedium?.copyWith(fontSize: 26.sp),
                ),
                onTap: () {
                  showResults(context);
                  Navigator.pushNamed(context, RouteManager.viewNoteScreen,
                      arguments: suggestions[index]);
                },
              );
            },
          );
  }
}
