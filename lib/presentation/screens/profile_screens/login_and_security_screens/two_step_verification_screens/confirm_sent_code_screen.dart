import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:jobsque/constants/screens.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/my_cache_keys.dart';
import '../../../../../data/local/my_cache.dart';
import '../../../../widgets/default_material_button.dart';
import '../../../../widgets/default_text.dart';

class ConfirmSentCodeScreen extends StatefulWidget {
  const ConfirmSentCodeScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmSentCodeScreen> createState() => _ConfirmSentCodeScreenState();
}

class _ConfirmSentCodeScreenState extends State<ConfirmSentCodeScreen> {
  String phone= MyCache.getString(key: MyCacheKeys.phoneNumber);
  String sentCode='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Two-step verification',
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.sp),
                  child: DefaultText(
                    text: 'Enter the 6 digit code',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.sp),
                  child: DefaultText(
                    text: 'Please confirm your account by entering the authorization code sen to *** ****${MyCache.getString(key: MyCacheKeys.phoneNumber).substring(7)}',
                    fontSize: 12.sp,
                    color: Colors.black38,
                  ),
                ),
                OtpTextField(
                  numberOfFields: 6,
                  fieldWidth: 12.w,
                  obscureText: true,
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onSubmit: (value) {
                    setState(() {
                      sentCode=value;
                      if (kDebugMode) {
                        print(sentCode);
                      }
                    });
                  },
                  //runs when every text-field is filled
                  // end onSubmit
                ),
              ],
            ),
            DefaultMaterialButton(
              onPressed:() {
                Navigator.of(context).pushNamed(mainLayout);
              },
              backgroundColor: buttonColor,
              child: const DefaultText(
                text: 'Verify',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
