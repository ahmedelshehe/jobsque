import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/constants/my_cache_keys.dart';
import 'package:jobsque/data/local/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/colors.dart';
import '../../../../widgets/default_material_button.dart';
import '../../../../widgets/default_password_field.dart';
import '../../../../widgets/default_text.dart';
import 'confirm_sent_code_screen.dart';

class VerifyNumberAndPasswordScreen extends StatefulWidget {
  const VerifyNumberAndPasswordScreen({Key? key}) : super(key: key);

  @override
  State<VerifyNumberAndPasswordScreen> createState() => _VerifyNumberAndPasswordScreenState();
}

class _VerifyNumberAndPasswordScreenState extends State<VerifyNumberAndPasswordScreen> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
  late bool isPasswordValidated;
  @override
  void initState() {
    _phoneNumberController=TextEditingController(text: MyCache.getString(key: MyCacheKeys.phoneNumber));
    _passwordController=TextEditingController(text: MyCache.getString(key: MyCacheKeys.myPassword));
    super.initState();
  }
  validatePassword(String value) {
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    text: 'Add phone number',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.sp),
                  child: DefaultText(
                    text: 'We will send a verification code to this number',
                    fontSize: 12.sp,
                    color: Colors.black38,
                  ),
                ),
                IntlPhoneField(
                  controller: _phoneNumberController,
                  initialCountryCode: 'EG',
                  validator: (value) {
                    if (value!.number.isEmpty) {
                      return 'phone number is empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  disableLengthCheck: true,
                  onChanged: (phone) {

                  },
                  onCountryChanged: (country) {
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.sp),
                  child: DefaultText(
                    text: 'Enter Password',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                PasswordField(
                  hintText: 'Password',
                  onChanged: (value) {
                    validatePassword(value);
                    setState(() {

                    });
                  },
                  passwordController: _passwordController,
                ),
              ],
            ),
            DefaultMaterialButton(
              onPressed:() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConfirmSentCodeScreen(),));
              },
              backgroundColor: buttonColor,
              child: const DefaultText(
                text: 'Send Code',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
