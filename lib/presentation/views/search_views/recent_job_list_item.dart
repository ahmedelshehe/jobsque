import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../view_models/recent_job_view_model.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';
import '../job_chip.dart';

class RecentJobListItem extends StatelessWidget {
  const RecentJobListItem({
    super.key, required this.model,
  });
  final RecentJobViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultSVG(
              imagePath: model.imagePath,
              width: 35.sp,
              height: 35.sp,
            ),
            SizedBox(
              width: 2.5.sp,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50.w,
                  child: DefaultText(
                    text: model.jobTitle,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                DefaultText(
                  text: '${model.companyName} • ${model.companyLocation} ',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(
              width: 10.sp,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  model.saved ?Icons.bookmark : Icons.bookmark_border_rounded,
                  color: buttonColor,
                  size: 24.sp,
                ))
          ],
        ),
        SizedBox(height: 1.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 5.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: model.chipsText.map((item) =>
                    JobChip(width: 18.w,text: item,chipColor: selectedTileColor,textColor: buttonColor,)
                ).toList(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DefaultText(
                    text: '\$${model.salary}',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                  DefaultText(
                    text: '/Month',
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 1.h,),
      ],
    );
  }
}