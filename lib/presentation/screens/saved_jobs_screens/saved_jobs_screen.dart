import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/saved_jobs/saved_jobs_cubit.dart';
import '../../views/saved_jobs_views/no_saved_jobs_view.dart';
import '../../views/saved_jobs_views/saved_jobs_list_view.dart';
import '../../widgets/default_text.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({Key? key}) : super(key: key);

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  late SavedJobsCubit savedJobsCubit;
  @override
  void initState() {
    savedJobsCubit=SavedJobsCubit.get(context);
    savedJobsCubit.getSavedJobs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedJobsCubit, SavedJobsState>(
  builder: (context, state) {
    if(state is SavedJobsLoadingState){
      return const Center(child: CircularProgressIndicator(color: Colors.blue,));
    } else{
      return Visibility(
        visible: savedJobsCubit.savedJobs.isNotEmpty,
        replacement: const NoSavedJobsView(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 7.sp),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ))),
              child: Center(
                child: DefaultText(
                  text: '${savedJobsCubit.savedJobs.length} jobs saved',
                  color: Colors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SavedJobsListView(savedJobsCubit: savedJobsCubit)
          ],
        ),
      );
    }
  },
);
  }
}






