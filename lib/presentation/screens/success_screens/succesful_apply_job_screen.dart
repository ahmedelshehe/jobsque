import 'package:flutter/material.dart';
import 'package:jobsque/business_logic/global/global_cubit.dart';
import 'package:jobsque/constants/screens.dart';
import 'package:jobsque/presentation/view_models/job_notification_view_model.dart';
import 'package:jobsque/presentation/widgets/default_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';

class ApplyJobSuccessScreen extends StatefulWidget {
  const ApplyJobSuccessScreen({Key? key}) : super(key: key);

  @override
  State<ApplyJobSuccessScreen> createState() => _ApplyJobSuccessScreenState();
}

class _ApplyJobSuccessScreenState extends State<ApplyJobSuccessScreen> {
  late GlobalCubit globalCubit;
  @override
  void initState() {
    globalCubit=GlobalCubit.get(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const DefaultText(
          text: 'Apply Job',
          color: Colors.black,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DefaultSVG(imagePath: 'assets/images/apply_success.svg'),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 7.w, vertical: 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultText(
                        text: 'Your data has been successfully sent',
                        fontSize: 24.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DefaultText(
                        text: 'You will get a message from our team, about the announcement of employee acceptance',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w200,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 7.w, vertical: 4.h),
            child: DefaultMaterialButton(
              onPressed: () {
                globalCubit.setJobNotification(JobNotificationViewModel(companyName: 'Google', imagePath: 'assets/icons/google.svg', status: JobNotificationStatus.applied));
                globalCubit.changeScreen(0);
                Navigator.of(context).pushNamedAndRemoveUntil(mainLayout, (route) => false);
              },
              backgroundColor: buttonColor,
              child: const DefaultText(
                text: 'Back To Home',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
