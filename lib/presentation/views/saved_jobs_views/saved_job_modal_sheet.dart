import 'package:flutter/material.dart';
import 'package:jobsque/presentation/views/saved_jobs_views/saved_jobs_modal_button.dart';
import 'package:sizer/sizer.dart';

import '../search_views/default_modal_sheet.dart';

class SavedJobModalSheet extends StatelessWidget {
  const SavedJobModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultModalSheet(
      children: [
        SavedJobsModalButton(
          icon: Icons.arrow_forward_ios,
          text: 'Apply job',
          onTap: () {},
        ),
        SavedJobsModalButton(
          icon: Icons.ios_share_outlined,
          text: 'Share via...',
          onTap: () {},
        ),
        SavedJobsModalButton(
          icon: Icons.bookmark_border_rounded,
          text: 'Cancel save',
          onTap: () {},
        ),
        SizedBox(
          height: 1.h,
        )
      ],
    );
  }
}