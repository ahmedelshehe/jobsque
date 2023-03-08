import 'package:flutter/material.dart';
import 'package:jobsque/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';

class JobFilterChip extends StatelessWidget {
  const JobFilterChip({
    super.key,
    required this.text,
    required this.onTap, required this.selected,
  });
  final String text;
  final VoidCallback onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.sp),
      child: GestureDetector(
        onTap: onTap,
        child: Chip(
          label: Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 30.w),
                child: DefaultText(
                  text:text,overflow: TextOverflow.ellipsis,
                  color: !selected?Colors.black :Colors.white,
                ),
              ),
              Icon(Icons.keyboard_arrow_down,
                color: !selected?Colors.black :Colors.white,
              ),
            ],
          ),
          backgroundColor:!selected? Colors.transparent :suggestedJobCardColor,
          side: const BorderSide(color: Colors.black12),
        ),
      ),
    );
  }
}
