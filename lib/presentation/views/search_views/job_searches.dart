import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/search/search_cubit.dart';
import '../../../constants/screens.dart';
import '../../widgets/default_text.dart';
import '../list_view_bar.dart';

class JobSearches extends StatefulWidget {
  const JobSearches({
    super.key,
  });
  @override
  State<JobSearches> createState() => _JobSearchesState();
}

class _JobSearchesState extends State<JobSearches> {
  late SearchCubit cubit;
  late List<Map> recentSearches;
  @override
  void initState() {
    cubit = SearchCubit.get(context);
    recentSearches = cubit.recentSearches;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
    listener: (context, state) {
      if(state is AppInsertSearchState || state is AppDeleteSearchState){
        recentSearches =cubit.recentSearches;
      }
    },
    child: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 2.h,),
              const ListViewBar(text: 'Recent searches'),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  int recentSearchId = recentSearches
                      .elementAt(recentSearches.length - 1 - index)['id'];
                  String recentSearchText = recentSearches
                      .elementAt(recentSearches.length - 1 - index)['text'];
                  return InkWell(
                    onTap: () {
                      cubit.searchJob(recentSearchText);
                      Navigator.of(context).pushNamed(searchResultsScreen,
                          arguments: recentSearchText);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.sp, vertical: 7.sp),
                      child: Row(
                        children: [
                          const Icon(Icons.watch_later_outlined),
                          SizedBox(
                            width: 2.w,
                          ),
                          DefaultText(
                            text: recentSearchText,
                            fontSize: 12.sp,
                          ),
                          const Spacer(),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.sp),
                            padding: EdgeInsets.all(1.sp),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(20.sp)),
                            child: InkWell(
                              onTap: () => cubit.deleteSearch(id: recentSearchId),
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: recentSearches.length > 6 ? 6 : recentSearches.length,
              )
            ],
          ),
          Column(
            children: [
              const ListViewBar(text: 'Popular searches'),
              Container(
                height: 32.h,
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(searchResultsScreen,
                            arguments: cubit.popularSearches.elementAt(index));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 7.sp),
                        child: Row(
                          children: [
                            const Icon(CupertinoIcons.search),
                            SizedBox(
                              width: 2.w,
                            ),
                            DefaultText(
                              text: cubit.popularSearches.elementAt(index),
                              fontSize: 12.sp,
                            ),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.all(1.sp),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(20.sp)),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                                size: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: cubit.popularSearches.length > 6
                      ? 6
                      : cubit.popularSearches.length,
                ),
              )
            ],
          )
        ],
      ),
);
  }
}
