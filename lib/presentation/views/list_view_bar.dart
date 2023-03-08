import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_text.dart';

class ListViewBar extends StatelessWidget {
  const ListViewBar({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 7.sp),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          border: Border.symmetric(
              horizontal: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              ))),
      child: DefaultText(
        text: text,
        color: Colors.grey,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
