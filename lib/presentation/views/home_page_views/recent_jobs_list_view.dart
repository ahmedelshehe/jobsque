import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../view_models/recent_job_view_model.dart';
import '../search_views/recent_job_list_item.dart';

class RecentJobsListView extends StatelessWidget {
  const RecentJobsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      height: 31.7.h,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return RecentJobListItem(
            model: RecentJobViewModel(
              imagePath: 'assets/images/zoom.svg',
              saved: false,
              salary: '15k',
              companyLocation: 'Indonesia',
              companyName: 'Zoom',
              jobTitle: 'Senior UX Designer',
              chipsText: ['Full-time', 'Remote', 'Design'],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 2.sp,
            color: Colors.black38,
            thickness: 0.5,
          );
        },
        itemCount: 5,
      ),
    );
  }
}
