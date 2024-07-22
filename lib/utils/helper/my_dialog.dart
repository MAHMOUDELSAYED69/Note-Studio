import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/extentions/extentions.dart';

import '../../view/widgets/my_elevated_button.dart';
import '../constants/colors.dart';

void openMyDialog(
  BuildContext context, {
  required String submitButtonText,
  required String title,
  void Function()? submitButtonMethod,
}) {
  showGeneralDialog(
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
                  color: ColorManager.dark),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.info,
                    color: ColorManager.grey,
                    size: 35.sp,
                  ),
                  Text(title,
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
                            title: submitButtonText,
                            onPressed: submitButtonMethod,
                          )),
                      const Spacer(),
                      Expanded(
                          flex: 4,
                          child: MyElevatedButton(
                            title: 'Discard',
                            backgroundColor: ColorManager.red,
                            onPressed: () => Navigator.pop(context),
                          )),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ));
}
