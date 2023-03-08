import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/apply_job/apply_job_cubit.dart';
import '../../../constants/colors.dart';
import '../../widgets/default_text.dart';

class ApplyJobProgressBar extends StatelessWidget {
  const ApplyJobProgressBar({
    super.key,
    required this.cubit,
  });

  final ApplyJobCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 20.sp,
              child: Icon(
                Icons.check,
                size: 30.sp,
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            DefaultText(
              text: 'Bio data',
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
            )
          ],
        ),
        DefaultText(
            text: '....',
            fontSize: 14.sp,
            color: cubit.currentStep==0 ? Colors.black :buttonColor
        ),
        Column(
          children: [
            Visibility(
              visible: cubit.currentStep !=2,
              replacement: Column(
                children: [
                  CircleAvatar(
                    radius: 20.sp,
                    child: Icon(
                      Icons.check,
                      size: 30.sp,
                    ),
                  ),
                  SizedBox(
                    height: 12.sp,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: cubit.currentStep==1 ? buttonColor :Colors.black12),
                ),
                child: DefaultText(
                    text: '2',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: cubit.currentStep==1 ? buttonColor :Colors.black
                ),
              ),
            ),
            SizedBox(
              height: 2.sp,
            ),
            DefaultText(
              text: 'Type of work',
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
            )
          ],
        ),
        DefaultText(
            text: '....',
            fontSize: 14.sp,
            color: cubit.currentStep==0 || cubit.currentStep ==1 ? Colors.black :buttonColor
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: cubit.currentStep==2 ? buttonColor :Colors.black12),
              ),
              child: DefaultText(
                  text: '3',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: cubit.currentStep==2 ? buttonColor :Colors.black
              ),
            ),
            SizedBox(
              height: 2.sp,
            ),
            DefaultText(
              text: 'Upload portfolio',
              fontSize: 8.sp,
              fontWeight: FontWeight.w300,
            )
          ],
        ),
      ],
    );
  }
}
