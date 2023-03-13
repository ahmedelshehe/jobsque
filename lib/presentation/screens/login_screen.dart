import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsque/business_logic/auth/auth_cubit.dart';
import 'package:jobsque/constants/colors.dart';
import 'package:jobsque/constants/screens.dart';
import 'package:jobsque/presentation/widgets/default_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../constants/response_codes.dart';
import '../widgets/default_material_button.dart';
import '../widgets/default_password_field.dart';
import '../widgets/default_svg.dart';
import '../widgets/default_text.dart';
import '../widgets/default_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthCubit authCubit;
  late bool _isRememberMe;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  var formKey = GlobalKey<FormState>();
  late bool isButtonEnabled;
  @override
  void initState() {
    authCubit=AuthCubit.get(context);
    _isRememberMe = false;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
      isButtonEnabled = false;
    } else {
      isButtonEnabled = true;
    }
    super.initState();
  }

  _handleRememberMe() {
    _isRememberMe = !_isRememberMe;
    setState(() {});
  }
  void onLogin() async{
    String response =
    await authCubit.login(
        _emailController.text,
        _passwordController.text);
    if (!context.mounted) return;
    if(response == successfulCode){
      Navigator.of(context).pushNamed(mainLayout);
    }else if(response == failureCode){
      Fluttertoast.showToast(
        msg: "Wrong email or password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    }else{
      Fluttertoast.showToast(
        msg: "Network Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    }
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
                              text: 'Login',
                              fontSize: 24.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultText(
                              text: 'Please login to find your dream job',
                              fontSize: 12.sp,
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
                            prefixIcon: const Icon(Icons.person_outlined),
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
                                if (_passwordController.text.isNotEmpty) {
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
                              if (_emailController.text.isNotEmpty) {
                                isButtonEnabled =
                                    value.isNotEmpty ? true : false;
                              }
                            });
                          },
                          passwordController: _passwordController,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _isRememberMe,
                                  onChanged: (value) {
                                    _handleRememberMe();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                DefaultText(
                                  text: 'Remember me',
                                  fontSize: 12.sp,
                                )
                              ],
                            ),
                            DefaultTextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(resetPasswordScreen);
                              },
                              child: DefaultText(
                                text: 'Forgot Password?',
                                fontSize: 12.sp,
                                color: buttonColor,
                              ),
                            )
                          ],
                        ),
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
                              text: 'Don’t have an account?',
                              fontSize: 12.sp,
                              color: Colors.black26,
                            ),
                            DefaultTextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(registerScreen);
                              },
                              child: DefaultText(
                                text: 'Register',
                                fontSize: 12.sp,
                                color: buttonColor,
                              ),
                            )
                          ],
                        ),
                        DefaultMaterialButton(
                          onPressed: isButtonEnabled ? () {
                            onLogin();
                          } : null,
                          backgroundColor: buttonColor,
                          child: DefaultText(
                            text: 'Login',
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
                                text: 'Or Login With Account',
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
                            SizedBox(width: 4.w,),
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
