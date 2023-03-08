import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../view_models/suggested_job_view_model.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';
import '../job_chip.dart';

class SuggestedJobListItem extends StatelessWidget {
  const SuggestedJobListItem({
    super.key, required this.model,
  });
  final SuggestedJobViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77.w,
      height: 25.h,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        color: model.itemColor,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Container(
        padding:
        EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(5.sp)),
                      child: DefaultSVG(
                        imagePath: model.imagePath,
                        width: 25.sp,
                        height: 25.sp,
                      ),
                    ),
                    SizedBox(
                      width: 2.5.sp,
                    ),
                    SizedBox(
                      width: 45.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: model.jobTitle,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: model.itemTextColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                          DefaultText(
                            text: '${model.companyName} • ${model.companyLocation}',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: model.itemSecondaryTextColor,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          model.saved ?Icons.bookmark: Icons.bookmark_border_rounded,
                          color: model.itemTextColor,
                          size: 24.sp,
                        ))
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  model.chipsText.map((chip) =>
                      JobChip(textColor: model.chipTextColor,chipColor: model.chipColor,text: chip,width: 20.w,)
                  ).toList(),
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DefaultText(
                      text: '\$${model.salary}',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: model.itemTextColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    DefaultText(
                      text: '/Month',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: model.itemSecondaryTextColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 6.sp, horizontal: 10.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: buttonColor),
                  child: Center(
                    child: DefaultText(
                      text: 'Apply now',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}