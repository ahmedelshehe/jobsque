import 'package:flutter/material.dart';
import 'package:jobsque/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_material_button.dart';
import '../../widgets/default_password_field.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late TextEditingController _confirmPasswordController;
  late TextEditingController _passwordController;
  var formKey = GlobalKey<FormState>();
  late bool isButtonEnabled;
  late bool isPasswordValidated;
  late bool isConfirmPasswordValidated;
  validatePassword(String value) {
    if (value.length > 8) {
      isPasswordValidated = true;
    } else {
      isPasswordValidated = false;
    }
  }
  validateConfirmPassword() {
    if (_confirmPasswordController.text == _passwordController.text) {
      isConfirmPasswordValidated = true;
    } else {
      isConfirmPasswordValidated = false;
    }
  }
  @override
  void initState() {
    isButtonEnabled = false;
    _confirmPasswordController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 7.w),
              child: DefaultSVG(
                imagePath: 'assets/images/logo.svg',
                width: 22.w,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SizedBox(
              height: 85.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 4.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'Create new password',
                              fontSize: 24.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultText(
                              text: 'Set your new password so you can login and access Jobsque',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w200,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: PasswordField(
                          hintText: 'New Password',
                          onChanged: (value) {
                            validatePassword(value);
                            setState(() {
                              if (_confirmPasswordController.text.isNotEmpty) {
                                isButtonEnabled =
                                value.isNotEmpty ? true : false;
                              }
                            });
                          },
                          passwordController: _passwordController,
                        ),
                      ),
                      SizedBox(
                        height:2.sp,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        child:  DefaultText(
                          text: 'Password must be at least 8 characters',
                          color:_passwordController.text.isEmpty ? Colors.black38 : isPasswordValidated ? Colors.green :Colors.red,
                          fontSize: 9.2.sp,
                        ),
                      ),
                      SizedBox(
                        height:4.sp,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: PasswordField(
                          hintText: 'Confirm Password',
                          onChanged: (value) {
                            validateConfirmPassword();
                            setState(() {
                              if (_passwordController.text.isNotEmpty) {
                                isButtonEnabled =
                                value.isNotEmpty ? true : false;
                              }
                            });
                          },
                          passwordController: _confirmPasswordController,
                        ),
                      ),
                      SizedBox(
                        height:2.sp,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        child:  DefaultText(
                          text: 'Both password must match',
                          color:_confirmPasswordController.text.isEmpty ? Colors.black38 : isConfirmPasswordValidated ? Colors.green :Colors.red,
                          fontSize: 9.2.sp,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultMaterialButton(
                          onPressed: isButtonEnabled ? () {} : null,
                          backgroundColor: buttonColor,
                          child: DefaultText(
                            text: 'Reset password',
                            color:
                            isButtonEnabled ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
