import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/extentions/extentions.dart';

import '../../utils/constants/images.dart';

class BuildEmptySearchbody extends StatelessWidget {
  const BuildEmptySearchbody({
    super.key,
    this.message,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          ImageManager.searching,
          width: context.width / 1.2,
        ),
        SizedBox(height: 5.h),
        Text(
          message ?? 'File not found. Try searching again.',
          style: context.textTheme.bodyMedium,
        )
      ],
    );
  }
}
