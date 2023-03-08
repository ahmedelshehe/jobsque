import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:jobsque/presentation/view_models/onboarding_page_view_model.dart';
import 'package:sizer/sizer.dart';

 List<OnBoardingViewModel> onboardingPages=[
    OnBoardingViewModel(
    image:'assets/images/onboarding_1.png' ,
    primaryText: 'Find a job, and start building your career from now on' ,
    secondaryText: 'Explore over 25,924 available job roles and upgrade your operator now.',
    words:{
      "start": HighlightedWord(
        textStyle:  TextStyle(
            fontSize: 30.sp,
            color: Colors.blue
        ),
      ),
      "building": HighlightedWord(
        textStyle:  TextStyle(
            fontSize: 30.sp,
            color: Colors.blue
        ),
      ),
    }
  ),
   OnBoardingViewModel(
       image:'assets/images/onboarding_2.png' ,
       primaryText: 'Hundreds of jobs are waiting for you to join together' ,
       secondaryText: 'Immediately join us and start applying for the job you are interested in.',
       words:{
         "join": HighlightedWord(
           textStyle:  TextStyle(
               fontSize: 30.sp,
               color: Colors.blue
           ),
         ),
         "together": HighlightedWord(
           textStyle:  TextStyle(
               fontSize: 30.sp,
               color: Colors.blue
           ),
         ),
       }
   ),
   OnBoardingViewModel(
       image:'assets/images/onboarding_3.png' ,
       primaryText: 'Get the best choice for the job you\'ve always dreamed of' ,
       secondaryText: 'The better the skills you have, the greater the good job opportunities for you.',
       words:{
         "choice": HighlightedWord(
           textStyle:  TextStyle(
               fontSize: 30.sp,
               color: Colors.blue
           ),
         ),
         "for": HighlightedWord(
           textStyle:  TextStyle(
               fontSize: 30.sp,
               color: Colors.blue
           ),
         ),
         "the job": HighlightedWord(
           textStyle:  TextStyle(
               fontSize: 30.sp,
               color: Colors.blue
           ),
         ),
       }
   ),
];
