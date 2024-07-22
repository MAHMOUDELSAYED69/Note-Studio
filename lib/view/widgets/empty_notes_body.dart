import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/extentions/extentions.dart';

import '../../utils/constants/images.dart';

class BuildEmptyNotesbody extends StatelessWidget {
  const BuildEmptyNotesbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          ImageManager.firstNote,
          width: context.width / 1.2,
        ),
        SizedBox(height: 5.h),
        Text(
          'Create your first note !',
          style: context.textTheme.bodyMedium,
        )
      ],
    );
  }
}
