import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';

class NoNotificationsView extends StatelessWidget {
  const NoNotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DefaultSVG(imagePath: 'assets/images/no_notification.svg'),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 7.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultText(
                text: 'No new notifications yet',
                fontSize: 22.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultText(
                text: 'You will receive a notification if there is something on your account',
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
