import 'package:flutter/material.dart';
import 'package:jobsque/data/local/my_cache.dart';
import 'package:jobsque/presentation/view_models/onboarding_page_view_model.dart';
import 'package:jobsque/presentation/widgets/default_material_button.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/colors.dart';
import '../../../constants/my_cache_keys.dart';
import '../../../constants/onboarding_content.dart';
import '../../views/on_boarding_page.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_button.dart';
import '../../../constants/screens.dart' as screens;
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingViewModel> views = onboardingPages;
  late PageController _pageController;
  late bool isLast = false;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            PageView.builder(
              itemBuilder: (context, index) {
                return OnBoardingPage(
                  model: views.elementAt(index),
                );
              },
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  if (index == views.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultSVG(
                    imagePath: 'assets/images/logo.svg',
                    width: 22.w,
                  ),
                  DefaultTextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(screens.loginScreen, (route) => false);
                    },
                    child: DefaultText(
                      text: 'Skip',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmoothPageIndicator(
                        controller: _pageController, // PageController
                        count: 3,
                        effect:  WormEffect(
                          dotWidth: 7.sp,
                          dotHeight: 7.sp,
                        ), // your preferred effect
                        onDotClicked: (index) {}),
                    SizedBox(height: 5.h,),
                    DefaultMaterialButton(
                      margin:EdgeInsets.all(12.sp) ,
                      backgroundColor: buttonColor,
                      onPressed: () {
                        if(isLast){
                          MyCache.putBoolean(key: MyCacheKeys.isOnBoardingViewed, value: isLast);
                          MyCache.putBoolean(key: MyCacheKeys.jobSearchAlertSetting, value: true);
                          MyCache.putBoolean(key: MyCacheKeys.jobApplicationUpdateSetting, value: true);
                          MyCache.putBoolean(key: MyCacheKeys.jobApplicationRemindersSetting, value: false);
                          MyCache.putBoolean(key: MyCacheKeys.jobsYouMayBeInterestedInSetting, value: true);
                          MyCache.putBoolean(key: MyCacheKeys.jobSeekerUpdateSetting, value: false);
                          MyCache.putBoolean(key: MyCacheKeys.showProfileSetting, value: true);
                          MyCache.putBoolean(key: MyCacheKeys.allMessagesSetting, value: true);
                          MyCache.putBoolean(key: MyCacheKeys.messageNudgesSetting, value: true);
                          MyCache.putBoolean(key: MyCacheKeys.twoStepVerification, value: false);
                          print(MyCache.getBoolean(key: MyCacheKeys.isOnBoardingViewed));
                          Navigator.of(context).pushNamedAndRemoveUntil(screens.loginScreen, (route) => false);
                        }else {
                          _pageController.nextPage(duration: const Duration(milliseconds: 250),curve: Curves.linear);
                        }
                      },
                      child: DefaultText(text:!isLast ?'Next' : 'Get Started',color: Colors.white,),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}


