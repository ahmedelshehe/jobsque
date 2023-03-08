import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text.dart';
import '../../widgets/default_text_button.dart';

class ChangeProfilePictureView extends StatelessWidget {
  const ChangeProfilePictureView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.sp, bottom: 5.sp),
          height: 12.h,
          child: Stack(
            children: [
              Center(
                child: ClipOval(
                  child: Image.asset('assets/images/profile.jpg',
                      color: Colors.black12.withOpacity(0.3),
                      colorBlendMode: BlendMode.darken),
                ),
              ),
              Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 25.sp,
                  color: Colors.white,
                  weight: 1,
                ),
              ),
            ],
          ),
        ),
        DefaultTextButton(
          onPressed: () {},
          child: DefaultText(
            text: 'Change Photo',
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
