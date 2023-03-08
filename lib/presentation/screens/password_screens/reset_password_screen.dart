import 'package:flutter/material.dart';
import 'package:jobsque/constants/colors.dart';
import 'package:jobsque/constants/screens.dart';
import 'package:jobsque/presentation/widgets/default_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_material_button.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController _emailController;
  var formKey = GlobalKey<FormState>();
  late bool isButtonEnabled;
  @override
  void initState() {
    _emailController = TextEditingController();
    if (_emailController.text.isEmpty) {
      isButtonEnabled = false;
    } else {
      isButtonEnabled = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
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
                              text: 'Reset Password',
                              fontSize: 24.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultText(
                              text:
                              'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w200,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: DefaultTextField(
                            controller: _emailController,
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              String pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value!)) {
                                return 'Enter Valid Email';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                  isButtonEnabled =
                                  formKey.currentState!.validate() ? true : false;
                              });
                            }),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefaultText(
                              text: 'You remember your password',
                              fontSize: 12.sp,
                              color: Colors.black26,
                            ),
                            DefaultTextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    loginScreen, (route) => false);
                              },
                              child: DefaultText(
                                text: 'Login',
                                fontSize: 12.sp,
                                color: buttonColor,
                              ),
                            )
                          ],
                        ),
                        DefaultMaterialButton(
                          onPressed: isButtonEnabled
                              ? () {
                            if(formKey.currentState!.validate()){
                              Navigator.of(context).pushNamed(newPasswordScreen);
                            }
                          }
                              : null,
                          backgroundColor: buttonColor,
                          child: DefaultText(
                            text: 'Request password reset',
                            color:
                            isButtonEnabled ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
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
