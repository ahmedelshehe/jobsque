import 'package:flutter/material.dart';
import 'package:jobsque/presentation/views/saved_jobs_views/saved_job_item.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/saved_jobs/saved_jobs_cubit.dart';

class SavedJobsListView extends StatelessWidget {
  const SavedJobsListView({
    super.key,
    required this.savedJobsCubit,
  });

  final SavedJobsCubit savedJobsCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 77.693.h,
      child: ListView.separated(
          itemBuilder: (context, index) => SavedJobItem(
            model: savedJobsCubit.savedJobs.elementAt(index),
          ),
          separatorBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const Divider(
                height: 0.5,
              ),
            );
          },
          itemCount: savedJobsCubit.savedJobs.length),
    );
  }
}