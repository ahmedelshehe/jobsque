import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../view_models/onboarding_page_view_model.dart';
import '../widgets/default_text.dart';
import '../widgets/default_text_highlight.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.model,
  });
  final OnBoardingViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          model.image,
          width: 100.w,
        ),
        Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              DefaultTextHighlight(
                text: model.primaryText,
                words: model.words,
                style: TextStyle(fontSize: 30.sp, color: Colors.black),
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultText(
                text: model.secondaryText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w200,
              )
            ],
          ),
        )
      ],
    );
  }
}