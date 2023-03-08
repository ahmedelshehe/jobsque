import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/job_details/job_details_cubit.dart';
import '../../../constants/colors.dart';
import '../../views/job_chip.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/switch_container.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late bool saved;
  late JobDetailsCubit cubit;
  bool details = true;
  List<String> chipsText = ['Fulltime', 'Onsite', 'Senior'];
  @override
  void initState() {
    cubit = JobDetailsCubit.get(context);
    saved = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const DefaultText(
          text: 'Job Detail',
          color: Colors.black,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              saved ? Icons.bookmark : Icons.bookmark_border_rounded,
              color: buttonColor,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 2.w),
        ],
      ),
      body: SizedBox(
        width: 100.w,
        child: Column(
          children: [
            DefaultSVG(
              imagePath: 'assets/images/twitter.svg',
              width: 35.sp,
              height: 35.sp,
            ),
            SizedBox(
              height: 2.h,
            ),
            DefaultText(
              text: 'Senior UI Designer',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 1.h,
            ),
            DefaultText(
              text: 'Twitter • Jakarta, Indonesia',
              fontSize: 11.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: chipsText
                  .map((item) => JobChip(
                        width: 18.w,
                        text: item,
                        chipColor: selectedTileColor,
                        textColor: buttonColor,
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 4.h,
            ),
            BlocBuilder<JobDetailsCubit, JobDetailsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                        color: unSelectedSwitchColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => cubit.changeIndex(0),
                            child: SwitchContainer(
                                text: 'Description',
                                buttonColor:cubit.currentIndex == 0 ? selectedSwitchColor :unSelectedSwitchColor,
                                textColor: cubit.currentIndex == 0
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          GestureDetector(
                            onTap: () => cubit.changeIndex(1),
                            child: SwitchContainer(
                                text: 'Company',
                                buttonColor:cubit.currentIndex == 1 ? selectedSwitchColor :unSelectedSwitchColor,
                                textColor: cubit.currentIndex == 1
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          GestureDetector(
                            onTap: () => cubit.changeIndex(2),
                            child: SwitchContainer(
                                text: 'People',
                                buttonColor:cubit.currentIndex == 2 ? selectedSwitchColor :unSelectedSwitchColor,
                                textColor: cubit.currentIndex == 2
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    cubit.jobDetailsViews[cubit.currentIndex]
                  ],
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: DefaultMaterialButton(
          onPressed: () {},
          backgroundColor: buttonColor,
          child: const DefaultText(
            text: 'Apply Now',
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
