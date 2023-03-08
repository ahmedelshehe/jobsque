import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_text.dart';

class JobChip extends StatelessWidget {
  const JobChip({
    super.key, required this.text, required this.chipColor, required this.textColor, required this.width,
  });
  final String text;
  final Color chipColor;
  final Color textColor;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(right: 5.sp),
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(10.sp),
          color: chipColor),
      child: Center(
        child: DefaultText(
          text: text,
          fontSize: 11.sp,
          fontWeight: FontWeight.w200,
          color: textColor,
        ),
      ),
    );
  }
}