import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../widgets/default_text.dart';

class ProfileIconListTile extends StatelessWidget {
  const ProfileIconListTile({
    super.key, required this.title, this.onTap, required this.icon,
  });
  final String title;
  final void Function()? onTap;
  final IconData icon;
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
        leading: CircleAvatar(
          backgroundColor: selectedTileColor,
          child: Icon(icon),
        ),
        title: DefaultText(text: title),
        trailing: const Icon(Icons.arrow_forward,color: Colors.black,),
      ),
    );
  }
}
