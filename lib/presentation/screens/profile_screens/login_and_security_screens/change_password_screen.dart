import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';
import '../../../widgets/default_material_button.dart';
import '../../../widgets/default_password_field.dart';
import '../../../widgets/default_text.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController _confirmPasswordController;
  late TextEditingController _passwordController;
  late TextEditingController _oldPasswordController;
  var formKey = GlobalKey<FormState>();
  late bool isButtonEnabled;
  late bool isPasswordValidated;
  late bool isOldPasswordValidated;
  late bool isConfirmPasswordValidated;
  validatePassword(String value) {
    if (value.length > 8) {
      isPasswordValidated = true;
    } else {
      isPasswordValidated = false;
    }
  }
  validateOldPassword(String value) {
    // // TODO: implement validating old Password
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
    _oldPasswordController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Change Password',
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
      body:Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 7.w,vertical: 1.h),
                    child:  DefaultText(text: 'Enter your old password',fontSize: 12.sp,fontWeight: FontWeight.w600,),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7.w),
                    child: PasswordField(
                      hintText: 'Old Password',
                      onChanged: (value) {
                        validateOldPassword(value);
                        setState(() {
                        });
                      },
                      passwordController: _oldPasswordController,
                    ),
                  ),
                  SizedBox(
                    height:2.sp,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 7.w,vertical: 1.h),
                    child:  DefaultText(text: 'Enter your new password',fontSize: 12.sp,fontWeight: FontWeight.w600,),
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
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 7.w,vertical: 1.h),
                    child:  DefaultText(text: 'Confirm your new password',fontSize: 12.sp,fontWeight: FontWeight.w600,),
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
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: DefaultMaterialButton(
                  onPressed: isButtonEnabled ? () {} : null,
                  backgroundColor: buttonColor,
                  child: const DefaultText(
                    text: 'Save',
                    color:Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
