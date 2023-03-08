import 'package:flutter/material.dart';
import 'package:jobsque/presentation/widgets/default_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';

class SuccessfulAccountSetUpScreen extends StatefulWidget {
  const SuccessfulAccountSetUpScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfulAccountSetUpScreen> createState() => _SuccessfulAccountSetUpScreenState();
}

class _SuccessfulAccountSetUpScreenState extends State<SuccessfulAccountSetUpScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DefaultSVG(imagePath: 'assets/images/success_account.svg'),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 7.w, vertical: 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultText(
                        text: 'Your account has been set up!',
                        fontSize: 24.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DefaultText(
                        text: 'We have customized feeds according to your preferences',
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
              },
              backgroundColor: buttonColor,
              child: const DefaultText(
                text: 'Get Started',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
