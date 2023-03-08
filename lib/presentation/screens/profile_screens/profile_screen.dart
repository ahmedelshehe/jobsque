import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/business_logic/global/global_cubit.dart';
import 'package:jobsque/constants/colors.dart';
import 'package:jobsque/constants/screens.dart';
import 'package:sizer/sizer.dart';

import '../../views/list_view_bar.dart';
import '../../views/profile_screen_views/profile_icon_list_tile.dart';
import '../../views/profile_screen_views/profile_list_tile.dart';
import '../../widgets/default_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late GlobalCubit globalCubit;
  @override
  void initState() {
    globalCubit = GlobalCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DefaultText(
          text: globalCubit.mainScreensTitles[globalCubit.screenCurrentIndex],
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: globalCubit.screenCurrentIndex != 4
            ? Colors.white
            : selectedTileColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () =>
              globalCubit.changeScreen(globalCubit.screenPreviousIndex),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          const Icon(
            Icons.login_rounded,
            color: Colors.red,
          ),
          SizedBox(
            width: 2.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 83.h,
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                      width: 100.w,
                      height: 150,
                      color: selectedTileColor,
                      child: Align(
                          alignment: Alignment(-1.4.sp, 4.0.sp),
                          child: Container(
                            width: 100.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 5.sp),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/profile.jpg'),
                              ),
                            ),
                          )))
                ],
              ),
              SizedBox(
                height: 7.5.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultText(
                    text: 'Rafif Dian Axelingga',
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text: 'Senior UI/UX Designer',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black26,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Container(
                width: 90.w,
                margin: EdgeInsets.all(5.w),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: unSelectedTileColor.withOpacity(0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 20.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: 'Applied',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black26,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          DefaultText(
                            text: '46',
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 6.h,
                      width: 1.sp,
                      color: Colors.black12,
                      margin: EdgeInsets.symmetric(horizontal: 4.5.w),
                    ),
                    SizedBox(
                      width: 20.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: 'Reviewed',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black26,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          DefaultText(
                            text: '32',
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 6.h,
                      width: 1.sp,
                      color: Colors.black12,
                      margin: EdgeInsets.symmetric(horizontal: 4.5.w),
                    ),
                    SizedBox(
                      width: 20.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: 'Contacted',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black26,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          DefaultText(
                            text: '12',
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      text: 'About',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                      textAlign: TextAlign.center,
                    ),
                    TextButton(onPressed: () {}, child: const Text('Edit'))
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: const DefaultText(
                    text:
                        'I\'m Rafif Dian Axel ingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.',
                    color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              const ListViewBar(text: 'General',),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 3.h),
                child: Column(
                  children:  [
                    ProfileIconListTile(
                      title: 'Edit Profile',
                      icon: Icons.person_2_outlined,
                      onTap: () {
                        Navigator.of(context).pushNamed(editProfileScreen);
                      },
                    ),
                    ProfileIconListTile(
                      title: 'Portfolio',
                      icon: Icons.folder_special_outlined,
                      onTap: () {
                        Navigator.of(context).pushNamed(addPortfolioScreen);
                      },
                    ),
                    ProfileIconListTile(
                      title: 'Language',
                      icon: CupertinoIcons.globe,
                      onTap: () {
                        Navigator.of(context).pushNamed(languageScreen);
                      },
                    ),
                    ProfileIconListTile(
                      title: 'Notification',
                      icon: Icons.notifications_none,
                      onTap: () {
                        Navigator.of(context).pushNamed(notificationsSettingsScreen);
                      },
                    ),
                    ProfileIconListTile(
                      title: 'Login and Security',
                      icon: Icons.lock_outline,
                      onTap: () {
                        Navigator.of(context).pushNamed(loginAndSecurityScreen);
                      },
                    ),
                  ],
                ),
              ),
              const ListViewBar(text: 'Other',),
              const ProfileListTile(title: 'Accessibility',),
              const ProfileListTile(title: 'Help Center',),
              const ProfileListTile(title: 'Terms & Conditions',),
              const ProfileListTile(title: 'Privacy Policy',),
              SizedBox( height: 3.h,),
            ],
          ),
        ),
      ),
    );
  }
}

