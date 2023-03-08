import 'package:flutter/material.dart';
import 'package:jobsque/presentation/widgets/default_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';

class CheckYourEmailScreen extends StatefulWidget {
  const CheckYourEmailScreen({Key? key}) : super(key: key);

  @override
  State<CheckYourEmailScreen> createState() => _CheckYourEmailScreenState();
}

class _CheckYourEmailScreenState extends State<CheckYourEmailScreen> {
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
                const DefaultSVG(imagePath: 'assets/images/email_sent.svg'),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 7.w, vertical: 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultText(
                        text: 'Check your Email',
                        fontSize: 24.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DefaultText(
                        text: 'We have sent a reset password to your email address',
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
                text: 'Open Email App',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
