import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/data/local/my_cache.dart';

import '../../constants/colors.dart';
import '../../constants/my_cache_keys.dart';
import '../../constants/screens.dart' as screens;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context,
          MyCache.getBoolean(key: MyCacheKeys.isOnBoardingViewed)
              ? screens.loginScreen
              : screens.onBoardingScreen,
          // screens.animationScreen,
              (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/splash_background.svg'),
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/logo.svg'),
          ),
        ],
      ),
    );
  }
}
