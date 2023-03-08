import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/global/global_cubit.dart';
import '../../../constants/colors.dart';
import '../../view_models/job_notification_view_model.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';

class HomePageNotification extends StatelessWidget {
  const HomePageNotification({
    super.key,
    required this.cubit,
  });

  final GlobalCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cubit.jobNotification,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  color: selectedTileColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.sp)),
                    child: DefaultSVG(
                      imagePath: cubit.notificationModel.imagePath,
                      width: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: cubit.notificationModel.companyName,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 42.w,
                        child: DefaultText(
                          text:cubit.notificationModel.status ==JobNotificationStatus.accepted ?
                          'You have been accepted for the selection interview' :
                          'Waiting to be selected by the twitter team'
                          ,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Chip(
                    label:  DefaultText(
                      text:cubit.notificationModel.status ==JobNotificationStatus.accepted ? 'Accepted' :'Applied',
                      fontWeight: FontWeight.w300,
                    ),
                    backgroundColor:cubit.notificationModel.status ==JobNotificationStatus.accepted ?
                    Colors.green.withOpacity(0.6) : Colors.blue.withOpacity(0.6),
                  )
                ],
              )),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
