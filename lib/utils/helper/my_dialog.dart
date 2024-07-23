import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/extentions/extentions.dart';

import '../../view/widgets/my_elevated_button.dart';
import '../constants/colors.dart';

Future<bool>? openMyDialog(
  BuildContext context, {
  String? submitButtonText,
  String? title,
  void Function()? submitButtonMethod,
  void Function()? cancelButtonMethod,
}) async {
  await showGeneralDialog(
      context: context,
      barrierColor: ColorManager.white.withOpacity(0.1),
      barrierDismissible: true,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) =>
          Dialog(
            child: Container(
              width: context.width,
              height: 220.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.theme.primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.info,
                    color: context.theme.canvasColor,
                    size: 35.sp,
                  ),
                  Text(title ?? 'Save changes ?',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w400,
                      )),
                  Row(
                    children: [
                      const Spacer(),
                      Expanded(
                          flex: 4,
                          child: MyElevatedButton(
                            title: submitButtonText ?? 'save',
                            onPressed: submitButtonMethod,
                          )),
                      const Spacer(),
                      Expanded(
                          flex: 4,
                          child: MyElevatedButton(
                            title: 'Discard',
                            backgroundColor: ColorManager.red,
                            onPressed: cancelButtonMethod ??
                                () => Navigator.popUntil(
                                    context, (route) => route.isFirst),
                          )),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ));
  return true;
}
