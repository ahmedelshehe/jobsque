import 'package:flutter/material.dart';
import 'package:jobsque/data/local/my_cache.dart';
import 'package:jobsque/presentation/screens/profile_screens/login_and_security_screens/two_step_verification_screens/two_step_verification_screen.dart';
import 'package:jobsque/presentation/views/list_view_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/my_cache_keys.dart';
import '../../views/profile_screen_views/profile_list_tile.dart';
import '../../widgets/default_text.dart';
import 'login_and_security_screens/change_email_screen.dart';
import 'login_and_security_screens/change_password_screen.dart';
import 'login_and_security_screens/change_phone_number_screen.dart';

class LoginAndSecurityScreen extends StatefulWidget {
  const LoginAndSecurityScreen({Key? key}) : super(key: key);

  @override
  State<LoginAndSecurityScreen> createState() => _LoginAndSecurityScreenState();
}

class _LoginAndSecurityScreenState extends State<LoginAndSecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Login and security',
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          const ListViewBar(text: 'Account access'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,))
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangeEmailScreen(),));
              },
              title: const DefaultText(text: 'Email address'),
              trailing: SizedBox(
                width: 50.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width:40.w,child:  DefaultText(text: MyCache.getString(key: MyCacheKeys.myEmail),color: Colors.black26,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                    const Icon(Icons.arrow_forward,color: Colors.black,),
                  ],
                ),
              ),
            ),
          ),
          ProfileListTile(title: 'Phone Number',onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangePhoneNumberScreen(),));
          },),
           ProfileListTile(title: 'Change password',onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangePasswordScreen(),));
          },),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,))
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TwoStepVerificationScreen(),));
              },
              title: const DefaultText(text: 'Two-step verification'),
              trailing: SizedBox(
                width: 40.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const DefaultText(text: 'Not Active',color: Colors.black26,maxLines: 1,overflow: TextOverflow.ellipsis,),
                    SizedBox(width: 1.w,),
                    const Icon(Icons.arrow_forward,color: Colors.black,),
                  ],
                ),
              ),
            ),
          ),
          const ProfileListTile(title: 'Face ID'),
        ],
      ),
    );
  }
}
