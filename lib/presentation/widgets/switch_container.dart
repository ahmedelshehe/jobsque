import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'default_text.dart';

class SwitchContainer extends StatelessWidget {
  const SwitchContainer({
    super.key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
  });

  final String text;
  final Color textColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.sp),
        color: buttonColor,
      ),
      child: DefaultText(
        text: text,
        fontSize: 11.sp,
        fontWeight: FontWeight.w200,
        color: textColor,
      ),
    );
  }
}
