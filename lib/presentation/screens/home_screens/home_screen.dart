import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/business_logic/global/global_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/colors.dart';
import '../../../constants/screens.dart';
import '../../views/home_page_views/featured_jobs_slider.dart';
import '../../views/home_page_views/home_page_notification.dart';
import '../../views/home_page_views/recent_jobs_list_view.dart';
import '../../widgets/default_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GlobalCubit cubit;
  @override
  void initState() {
    cubit=GlobalCubit.get(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 7.h, left: 8.w, right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'Hi, Rafi Dian👋',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      DefaultText(
                        text: 'Create a better future for yourself here',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(notificationScreen),
                    child: Badge(
                      backgroundColor: suggestedJobCardColor,
                      label: Text('${cubit.allNotification.length}'),
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(color: Colors.black38),
                        ),
                        child: Icon(CupertinoIcons.bell, size: 25.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(searchJobScreen);
              },
              child: Container(
                width: 85.w,
                padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
                margin: EdgeInsets.only(left: 8.w, right: 8.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    border: Border.all(color: Colors.black12)),
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.search),
                    SizedBox(
                      width: 2.w,
                    ),
                    DefaultText(
                      text: 'Search...',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                    text: 'Suggested Job',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  DefaultText(
                    text: 'View all',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            HomePageNotification(cubit: cubit),
            const FeaturedJobsSlider(),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                    text: 'Recent Jobs',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  DefaultText(
                    text: 'View all',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const RecentJobsListView()
          ],
        ),
      );
  }
}



