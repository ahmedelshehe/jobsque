import 'package:flutter/material.dart';
import 'package:jobsque/constants/colors.dart';
import 'package:jobsque/constants/screens.dart';
import 'package:jobsque/presentation/widgets/default_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_material_button.dart';
import '../../widgets/default_password_field.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  var formKey = GlobalKey<FormState>();
  late bool isButtonEnabled;
  late bool isPasswordValidated;
  validatePassword(String value){
    if(value.length>8){
      isPasswordValidated= true;
    }else{
      isPasswordValidated= false;
    }

  }
  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    if (_usernameController.text.isEmpty && _passwordController.text.isEmpty) {
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
                              text: 'Create Account',
                              fontSize: 24.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultText(
                              text:
                                  'Please create an account to find your dream job',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w200,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: DefaultTextField(
                          controller: _usernameController,
                          hintText: 'Username',
                          prefixIcon: const Icon(Icons.person_outlined),
                          onChanged: (value) {
                            setState(() {
                              if (_passwordController.text.isNotEmpty &&
                                  _emailController.text.isNotEmpty) {
                                isButtonEnabled =
                                    value.isNotEmpty ? true : false;
                              }
                            });
                          },
                          validator: (value) {
                            if (value!.length < 3) {
                              return 'Username must be more than 2 character';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
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
                                if (_passwordController.text.isNotEmpty &&
                                    _usernameController.text.isNotEmpty) {
                                  isButtonEnabled =
                                      value.isNotEmpty ? true : false;
                                }
                              });
                            }),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: PasswordField(
                          onChanged: (value) {
                            setState(() {
                              validatePassword(value);
                              if (_usernameController.text.isNotEmpty &&
                                  _emailController.text.isNotEmpty) {
                                isButtonEnabled =
                                    value.isNotEmpty ? true : false;
                              }
                            });
                          },
                          passwordController: _passwordController,
                          validator: (value) {
                            if (value!.length < 8) {
                              return '';
                            } else {
                              return null;
                            }
                          },
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
                        height: 1.h,
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
                              text: 'Already have an account?',
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
                            // TODO: implement saving user registration details
                            if(formKey.currentState!.validate()){
                                    Navigator.of(context).pushNamedAndRemoveUntil(chooseRolesScreen, (route) => false);
                                  }
                                }
                              : null,
                          backgroundColor: buttonColor,
                          child: DefaultText(
                            text: 'Create Account',
                            color:
                                isButtonEnabled ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                                height: 2.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: DefaultText(
                                text: 'Or Sign Up With Account',
                                fontSize: 10.sp,
                                color: Colors.black38,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                                height: 2.h,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 8.w),
                                child: Row(
                                  children: [
                                    const DefaultSVG(
                                      imagePath: 'assets/icons/google.svg',
                                      fit: BoxFit.contain,
                                      alignment: AlignmentDirectional.center,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    const DefaultText(
                                      text: 'Google',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 1.8.h, horizontal: 6.8.w),
                                child: Row(
                                  children: [
                                    const DefaultSVG(
                                      imagePath: 'assets/icons/facebook.svg',
                                      fit: BoxFit.contain,
                                      alignment: AlignmentDirectional.center,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    const DefaultText(
                                      text: 'Facebook',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
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
