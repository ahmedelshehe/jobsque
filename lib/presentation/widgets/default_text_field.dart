import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required TextEditingController controller,  this.prefixIcon, required this.hintText, this.onChanged, this.keyboardType, this.validator,
  }) : _controller = controller;

  final TextEditingController _controller;
  final Icon? prefixIcon;
  final String hintText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType ?? TextInputType.text,
      validator:validator ,
      controller: _controller,
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIconColor: Colors.black26,
          prefixIcon: prefixIcon,
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
              const BorderSide(width: 1, color: Colors.red)) ,
          hintText:hintText,
          hintStyle: const TextStyle(color: Colors.black26)),
          autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}