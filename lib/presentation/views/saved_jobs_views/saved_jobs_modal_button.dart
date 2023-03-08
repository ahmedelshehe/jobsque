import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text.dart';

class SavedJobsModalButton extends StatelessWidget {
  const SavedJobsModalButton({
    super.key, required this.text, required this.icon, required this.onTap,
  });
  final String text;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
      child: GestureDetector(
          onTap:onTap,
          child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              border: Border.all(color: Colors.black12),
            ),
            padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Row(
                  children: [
                    Icon(Icons.inbox_outlined,weight: 5.sp,),
                    SizedBox(width: 5.sp,),
                    DefaultText(text: text,fontSize: 16.sp,fontWeight: FontWeight.w600),
                  ],
                ),
                Icon(icon,weight: 5.sp,)
              ],

            ),
          )
      ),
    );
  }
}
