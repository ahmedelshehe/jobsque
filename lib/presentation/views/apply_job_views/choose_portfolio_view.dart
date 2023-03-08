import 'package:flutter/material.dart';
import 'package:jobsque/business_logic/apply_job/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text.dart';

class ChoosePortfolioView extends StatefulWidget {
  const ChoosePortfolioView({
    super.key,
  });
  @override
  State<ChoosePortfolioView> createState() => _ChoosePortfolioViewState();
}

class _ChoosePortfolioViewState extends State<ChoosePortfolioView> {
  late ApplyJobCubit cubit;
  @override
  void initState() {
    cubit=ApplyJobCubit.get(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: 'Type of work',
          fontSize: 20.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 1.h,
        ),
        DefaultText(
          text: 'Choose suitable portfolio',
          fontSize: 10.sp,
          fontWeight: FontWeight.w200,
        ),
        SizedBox(
          height: 3.h,
        ),
        SizedBox(
          height: 70.h,
          child: ListView.separated(
            padding: EdgeInsets.only(bottom: 20.h),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  cubit.setSelectedPortfolio(index);
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 2.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10.sp)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: cubit.portfolioOptions.elementAt(index)['name']!,
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          DefaultText(
                            text: cubit.portfolioOptions.elementAt(index)['fileName']!,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w200,
                          ),
                        ],
                      ),
                      Radio(
                        value: index,
                        groupValue: cubit.portfolioIndex,
                        activeColor: Colors.blue,
                        onChanged: (val) {
                          cubit.setSelectedPortfolio(index);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 2.h,);
            },
            itemCount: cubit.portfolioOptions.length,
          ),
        )
      ],
    );
  }
}