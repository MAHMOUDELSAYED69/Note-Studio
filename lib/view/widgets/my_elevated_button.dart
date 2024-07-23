import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton(
      {super.key, required this.title, this.onPressed, this.backgroundColor});
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: context.elevatedButtonTheme.style?.copyWith(
          backgroundColor:
              WidgetStatePropertyAll(backgroundColor ?? ColorManager.green),
          fixedSize: WidgetStatePropertyAll(Size(context.width, 34.h)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: context.textTheme.displayMedium?.copyWith(
            color: context.textTheme.bodyMedium?.color,
            fontSize: 15.sp,
          ),
        ));
  }
}
