import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key, required this.passwordController, this.onChanged, this.validator, this.hintText}) : super(key: key);
  final TextEditingController passwordController;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  IconData suffixIcon = Icons.visibility_off_outlined;
  bool isHidden = true;
  void handleIsHidden(){
    setState(() {
      if (isHidden) {
        suffixIcon = Icons.remove_red_eye_outlined;
      } else {
        suffixIcon = Icons.visibility_off_outlined;
      }
      isHidden = !isHidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:8.h,
      child: TextFormField(
        validator: widget.validator,
        onChanged: widget.onChanged,
        controller: widget.passwordController,
        obscureText: isHidden,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            prefixIconColor: Colors.black26,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  if (isHidden) {
                    suffixIcon = Icons.remove_red_eye_outlined;
                  } else {
                    suffixIcon = Icons.visibility_off_outlined;
                  }
                  isHidden = !isHidden;
                });
              },
              icon: Icon(
                suffixIcon,
                color:isHidden ? Colors.black26 :Colors.black,
              ),
            ),
            errorStyle:TextStyle(fontSize: 0.sp),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                const BorderSide(width: 1, color: Colors.black38)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                const BorderSide(width: 2, color: buttonColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                const BorderSide(width: 1, color: Colors.red)),
            focusedErrorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                const BorderSide(width: 1, color: Colors.red)),
            hintText: widget.hintText ?? 'Password',
            hintStyle: const TextStyle(color: Colors.black26)),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
