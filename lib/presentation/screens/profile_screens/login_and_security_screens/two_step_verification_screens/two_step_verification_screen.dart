import 'package:flutter/material.dart';
import 'package:jobsque/presentation/screens/profile_screens/login_and_security_screens/two_step_verification_screens/verify_number_password_screen.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/colors.dart';
import '../../../../widgets/default_material_button.dart';
import '../../../../widgets/default_text.dart';

class TwoStepVerificationScreen extends StatefulWidget {
  const TwoStepVerificationScreen({Key? key}) : super(key: key);

  @override
  State<TwoStepVerificationScreen> createState() =>
      _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState extends State<TwoStepVerificationScreen> {
  final _dropDownMenuKey = GlobalKey<FormFieldState>();
  late bool isTwoStepVerificationOn; // TSV is fot two step verifications
  @override
  void initState() {
    isTwoStepVerificationOn = false;
    super.initState();
  }

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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: SwitchListTile(
                      title: DefaultText(
                        text:
                            'Secure your account with \ntwo-step verification',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                      ),
                      value: isTwoStepVerificationOn,
                      onChanged: (bool value) {
                        setState(() {
                          isTwoStepVerificationOn = value;
                        });
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: DefaultText(
                    text: 'Select a verification method',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                DropdownButtonFormField(
                  key: _dropDownMenuKey,
                  menuMaxHeight: 50.h,
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black38)),
                    hintText: 'Salary Range',
                    hintStyle: const TextStyle(color: Colors.black26),
                  ),
                  items: const [
                    DropdownMenuItem(
                        child: DefaultText(
                      text: 'Telephone number (SMS)',
                    ))
                  ],
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 1.h,
                ),
                 DefaultText(
                  text:
                      'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
                  textStyle: TextStyle(
                    height: 1.3.sp,
                    color: Colors.black38,
                  ),
                )
              ],
            ),
            DefaultMaterialButton(
              onPressed:isTwoStepVerificationOn ? () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerifyNumberAndPasswordScreen(),));
              } : null,
              backgroundColor: buttonColor,
              child: const DefaultText(
                text: 'Next',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
