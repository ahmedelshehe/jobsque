import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsque/constants/colors.dart';
import 'package:jobsque/constants/screens.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/auth/auth_cubit.dart';
import '../../views/choose_role_view.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';

class ChooseRolesScreen extends StatefulWidget {
  const ChooseRolesScreen({Key? key}) : super(key: key);

  @override
  State<ChooseRolesScreen> createState() => _ChooseRolesScreenState();
}

class _ChooseRolesScreenState extends State<ChooseRolesScreen> {
  late Map<String, String> roles;
  final List<String> _titles = [];
  late AuthCubit authCubit;
  @override
  void initState() {
    roles = {
      'UI/UX Designer': 'assets/icons/ui.svg',
      'Illustrator Designer': 'assets/icons/illustrator.svg',
      'Developer': 'assets/icons/developer.svg',
      'Management': 'assets/icons/mgt.svg',
      'Information Technology': 'assets/icons/it.svg',
      'Research and Analytics': 'assets/icons/research.svg',
    };
    authCubit=AuthCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 8.h),
              child: Column(
                children: [
                  DefaultText(
                    text: 'What type of work are you interested in?',
                    fontSize: 24.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text:
                        'Tell us what you’re interested in so we can customise the app for your needs.',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w200,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                  child: ChooseRoleView(roles:roles,titles: _titles, ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h, right: 4.w, left: 4.w),
                  child: DefaultMaterialButton(
                    onPressed: () {
                      if(_titles.isNotEmpty){
                        authCubit.chooseRoles(_titles);

                        Navigator.pushNamedAndRemoveUntil(context, chooseLocationScreen, (route) => false);
                      }else{
                        Fluttertoast.showToast(
                          msg: "You have to choose at least one",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          fontSize: 16.0,
                        );
                      }
                    },
                    backgroundColor: buttonColor,
                    child: const DefaultText(
                      text: 'Next',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
