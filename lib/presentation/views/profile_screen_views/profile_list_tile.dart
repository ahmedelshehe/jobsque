import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key, required this.title, this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12,))
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        title: DefaultText(text: title),
        trailing: const Icon(Icons.arrow_forward,color: Colors.black,),
      ),
    );
  }
}
