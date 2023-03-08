import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../view_models/suggested_job_view_model.dart';
import '../search_views/suggested_job_list_item.dart';

class FeaturedJobsSlider extends StatelessWidget {
  const FeaturedJobsSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26.h,
      padding: EdgeInsets.only(left: 8.w),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SuggestedJobListItem(
              model: SuggestedJobViewModel(
                  itemColor: suggestedJobCardColor,
                  imagePath: 'assets/images/zoom.svg',
                  jobTitle: 'Product Designer',
                  companyName: 'Zoom',
                  companyLocation: 'United States',
                  chipColor: Colors.white10,
                  chipTextColor: Colors.white,
                  chipsText: ['Full-time', 'Remote', 'Design'],
                  salary: '12k-15k',
                  itemTextColor: Colors.white,
                  itemSecondaryTextColor: Colors.white60,
                  saved: true),
            );
          } else {
            return SuggestedJobListItem(
              model: SuggestedJobViewModel(
                  itemColor: Colors.white,
                  imagePath: 'assets/images/discord.svg',
                  jobTitle: 'Web Designer',
                  companyName: 'Slack',
                  companyLocation: 'United States',
                  chipColor: selectedTileColor,
                  chipTextColor: Colors.black,
                  chipsText: ['Full-time', 'Remote', 'Design'],
                  salary: '12k-15k',
                  itemTextColor: Colors.black,
                  itemSecondaryTextColor: Colors.black54,
                  saved: false),
            );
          }
        },
        itemCount: 5,
      ),
    );
  }
}
