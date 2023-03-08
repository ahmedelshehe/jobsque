import 'package:flutter/material.dart';
import 'package:jobsque/constants/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text.dart';

class LanguageRadioListTile extends StatelessWidget {
  const LanguageRadioListTile({
    super.key,
    required this.value, required this.flag, required this.groupValue, required this.onChanged,
  });

  final String groupValue;
  final String value;
  final String flag;
  final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onChanged(value),
          contentPadding: EdgeInsets.symmetric(horizontal:5.w,vertical: 1.h),
          leading:DefaultText(text:flag.toFlag(),fontSize: 16.sp,) ,
          title:DefaultText(text:value.capitalize(),fontSize: 16.sp,),
          trailing: Radio(
            groupValue: groupValue, value: value, onChanged: (value) => onChanged(value),
          ),
        ),
        Divider(height: 2.sp,color: Colors.black12,),
      ],
    );
  }
}