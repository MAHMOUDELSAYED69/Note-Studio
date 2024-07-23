import 'package:flutter/material.dart';
import '../../utils/extentions/extentions.dart';

import '../constants/colors.dart';

void customSnackBar(BuildContext context,
    {String? message, Color? color, int? seconds}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      width: context.width / 1.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      duration: Duration(seconds: seconds ?? 2),
      backgroundColor: (color ?? ColorManager.red).withOpacity(0.9),
      behavior: SnackBarBehavior.floating,
      elevation: 1,
      showCloseIcon: true,
      closeIconColor: context.textTheme.bodySmall?.color,
      content: Center(
        child: Text(
          message ?? "there was an error please try again later!",
          style: context.textTheme.bodySmall,
        ),
      )));
}
