import 'package:flutter/material.dart';
import 'package:note_studio/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';

class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });
  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: ColorManager.darkGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          iconData,
          color: context.iconTheme.color,
        ),
      ),  
    );
  }
}
