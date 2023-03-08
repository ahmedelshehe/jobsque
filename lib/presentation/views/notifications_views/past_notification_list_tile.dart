import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../view_models/main_notification_view_model.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';

class PastNotificationListTile extends StatelessWidget {
  const PastNotificationListTile({
    required this.model,
    super.key,
  });
  final MainNotificationViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ClipOval(
            child: DefaultSVG(
              imagePath: model.imagePath,
              width: 45.sp,
              fit: BoxFit.cover,
            ),
          ),
          trailing: Column(
            children: [
              SizedBox(height: 1.h,),
              SizedBox(
                width: 25.w,
                child: Row(
                  children: [
                    Icon(Icons.circle,color: Colors.yellow,size: 10.sp,),
                    DefaultText(
                      text: '${model.dateDays} days ago',
                      color: Colors.grey,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
          title: DefaultText(
            text: model.title,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
          subtitle: DefaultText(
            text: model.content,
            color: Colors.grey,
            fontSize: 9.sp,
            fontWeight: FontWeight.w300,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: const Divider(
            height: 0.5,
          ),
        )
      ],
    );
  }
}
