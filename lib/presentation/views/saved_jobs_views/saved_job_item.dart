import 'package:flutter/material.dart';
import 'package:jobsque/presentation/views/saved_jobs_views/saved_job_modal_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../view_models/saved_job_view_model.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';

class SavedJobItem extends StatelessWidget {
  const SavedJobItem({
    super.key,
    required this.model,
  });
  final SavedJobViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(
                    height: 5.sp,
                  ),
                  DefaultText(
                    text: '${model.companyName} • ${model.companyLocation}  ',
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
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const SavedJobModalSheet();
                    },
                  );
                },
                icon: Icon(
                  Icons.more_horiz_rounded,
                  size: 24.sp,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                text: model.postDateDays,
                fontSize: 11.sp,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: 12.sp,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  DefaultText(
                    text: 'Be an early applicant',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

