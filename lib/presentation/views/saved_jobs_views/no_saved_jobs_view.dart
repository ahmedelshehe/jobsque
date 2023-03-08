import 'package:flutter/material.dart';
import 'package:jobsque/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_svg.dart';

class NoSavedJobsView extends StatelessWidget {
  const NoSavedJobsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DefaultSVG(imagePath: 'assets/images/no_saved_jobs.svg'),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 7.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultText(
                text: 'Nothing has been saved yet',
                fontSize: 24.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultText(
                text: 'Press the star icon on the job you want to save.',
                fontSize: 12.sp,
                fontWeight: FontWeight.w200,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],
    );
  }
}