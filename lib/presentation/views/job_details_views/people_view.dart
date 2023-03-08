import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/job_details/job_details_cubit.dart';
import '../../view_models/personnel_view_model.dart';
import '../../widgets/default_text.dart';

class JobPeopleView extends StatefulWidget {
  const JobPeopleView({Key? key}) : super(key: key);

  @override
  State<JobPeopleView> createState() => _JobPeopleViewState();
}

class _JobPeopleViewState extends State<JobPeopleView> {
  late List<String> positions;
  late JobDetailsCubit cubit;
  @override
  void initState() {
    cubit =JobDetailsCubit.get(context);
    positions=['UI/UX Design','Front end Developer','Backend developer','It Admin'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: '6 Employees For',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  DefaultText(
                    text: 'UI/UX Design',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black26,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              Container(
                width: 41.w,
                height: 6.h,
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(25.sp),
                ),
                child: DropdownButtonFormField(
                  value: positions[0],
                  borderRadius: BorderRadius.circular(25.sp),
                  decoration: const InputDecoration(
                    border: InputBorder.none
                  ),
                  items:positions.map((position) => DropdownMenuItem<String>(
                    value: position,
                    child: DefaultText(text:position,fontSize: 9.sp),
                  )).toList(),
                  onChanged: (value) {  },
                 ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              padding:  EdgeInsets.only(bottom: 7.h),
              itemBuilder: (context, index) {
                PersonnelViewModel person =cubit.personnel.elementAt(index);
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    child: Text(person.name.substring(0,2).toUpperCase()),
                  ),
                  title: Text(person.name),
                  subtitle: Text(person.position!),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DefaultText(text: 'Working'),
                      DefaultText(text: '${person.years.floor()} years'),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2.sp,
                  color: Colors.black,
                );
              }, itemCount: cubit.personnel.length,
            ),
          )
        ],
      ),
    );
  }
}
