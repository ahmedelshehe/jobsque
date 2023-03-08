import 'package:flutter/material.dart';
import 'package:jobsque/constants/colors.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/switch_container.dart';
import '../../widgets/default_text.dart';
import 'package:jobsque/constants/countries.dart';
class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  late bool remote;
  List<String> locations =[];
  String codeToFlag(String countryCode){
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0)+ 127397));
  }
  @override
  void initState() {
    remote = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 8.h),
            child: Column(
              children: [
                DefaultText(
                  text: 'Where are your preferred Location?',
                  fontSize: 24.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 1.h,
                ),
                DefaultText(
                  text:
                      'Let us know, where is the work location you want at this time, so we can adjust it.',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w200,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.sp),
                    color: unSelectedSwitchColor,
                  ),
                  child: buildLocationSwitch(),
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w, right: 7.w),
            child: DefaultText(
              text:
              'Select the country you want for your job',
              fontSize: 11.sp,
              fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(
            height: 50.h,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 2.w,
                  children: countries.map((country){
                    return FilterChip(
                      padding:EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                      label: DefaultText(text: country['name'],fontSize: 13.sp,fontWeight: FontWeight.w300,),
                      avatar:ClipOval(child: DefaultText(text: codeToFlag(country['code']),fontSize: 14.sp,)),
                      selected:locations.contains(country['code']),
                      selectedColor: selectedTileColor,
                      backgroundColor: unSelectedTileColor,
                      showCheckmark: false,
                      shape:locations.contains(country['code']) ? const StadiumBorder(
                        side: BorderSide(color: Colors.blueAccent)
                      ): null,
                      onSelected: (value) {
                        setState(() {
                          if (value) {
                            if (!locations.contains(country['code'])) {
                              locations.add(country['code']);
                            }
                          } else {
                            locations.removeWhere((String name) {
                              return name == country['code'];
                            });
                          }
                        });
                    },);
                  }).toList()
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, right: 4.w, left: 4.w),
            child: DefaultMaterialButton(
              onPressed: () {},
              backgroundColor: buttonColor,
              child: const DefaultText(
                text: 'Next',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildLocationSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (remote) remote = false;
            });
          },
          child: SwitchContainer(
              text: 'Work From Office',
              buttonColor:
                  !remote ? selectedSwitchColor : unSelectedSwitchColor,
              textColor: !remote ? Colors.white : Colors.black),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (!remote) remote = true;
            });
          },
          child: SwitchContainer(
              text: 'Remote Work',
              buttonColor: remote ? selectedSwitchColor : unSelectedSwitchColor,
              textColor: remote ? Colors.white : Colors.black),
        ),
      ],
    );
  }
}
