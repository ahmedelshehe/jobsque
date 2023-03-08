import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/search/search_cubit.dart';
import '../../../constants/search_filters.dart';
import 'filter_modal_sheet_content.dart';
import 'job_filter_chip.dart';

class FiltersBarView extends StatelessWidget {
  const FiltersBarView({
    super.key,
    required this.cubit,
  });

  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SizedBox(
          height: 7.h,
          width: 87.8.w,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              JobFilterChip(
                onTap: () => showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return FilterModalSheetContent(
                      options: locationTypeOptions,
                      cubit: cubit,
                      title: 'On-Site/Remote',
                      types: cubit.locationType,
                      addOrRemoveFunction: cubit.addOrRemoveLocationType,
                    );
                  },
                ),
                text: cubit.locationType.isEmpty
                    ? 'On-Site/Remote'
                    : cubit.locationType.join(' | '),
                selected: cubit.locationType.isNotEmpty,
              ),
              JobFilterChip(
                onTap: () => showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return FilterModalSheetContent(
                      options: jobTypeOptions,
                      cubit: cubit,
                      title: 'Job Type',
                      types: cubit.jobType,
                      addOrRemoveFunction: cubit.addOrRemoveJobType,
                    );
                  },
                ),
                text: cubit.jobType.isEmpty
                    ? 'Job Type'
                    : cubit.jobType.join('| '),
                selected: cubit.jobType.isNotEmpty,
              ),
              JobFilterChip(
                onTap: () => showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return FilterModalSheetContent(
                      options: postDateOptions,
                      cubit: cubit,
                      title: 'Post Date',
                      types: cubit.postDateTypes,
                      addOrRemoveFunction: cubit.addOrRemovePostDateType,
                    );
                  },
                ),
                text: cubit.postDateTypes.isEmpty
                    ? 'Post Date'
                    : cubit.postDateTypes.join(' | '),
                selected: cubit.postDateTypes.isNotEmpty,
              ),
              JobFilterChip(
                onTap: () => showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return FilterModalSheetContent(
                      options: jobLevelsOptions,
                      cubit: cubit,
                      title: 'Experience Level',
                      types: cubit.jobLevels,
                      addOrRemoveFunction: cubit.addOrRemoveJobLevel,
                    );
                  },
                ),
                text: cubit.jobLevels.isEmpty
                    ? 'Experience Level'
                    : cubit.jobLevels.join(' | '),
                selected: cubit.jobLevels.isNotEmpty,
              ),
            ],
          ),
        );
      },
    );
  }
}