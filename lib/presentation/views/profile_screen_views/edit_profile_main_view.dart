import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../constants/my_cache_keys.dart';
import '../../../data/local/my_cache.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_field.dart';

class EditProfileMainView extends StatefulWidget {
  const EditProfileMainView({
    super.key,
  });

  @override
  State<EditProfileMainView> createState() => _EditProfileMainViewState();
}

class _EditProfileMainViewState extends State<EditProfileMainView> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController bioController;
  late TextEditingController addressController;
  late TextEditingController phoneNumberController;
  @override
  void initState() {
    fullNameController=TextEditingController(text: MyCache.getString(key: MyCacheKeys.fullName));
    bioController=TextEditingController(text: MyCache.getString(key: MyCacheKeys.bio));
    addressController=TextEditingController(text: MyCache.getString(key: MyCacheKeys.address));
    phoneNumberController=TextEditingController(text: MyCache.getString(key: MyCacheKeys.phoneNumber));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: 'Name',
                  fontSize: 14.sp,
                  color: Colors.black26,
                ),
                SizedBox(
                  height: 1.h,
                ),
                DefaultTextField(
                  hintText: 'Full Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Full Name is empty';
                    } else {
                      return null;
                    }
                  }, controller: fullNameController,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                DefaultText(
                  text: 'Bio',
                  fontSize: 14.sp,
                  color: Colors.black26,
                ),
                SizedBox(
                  height: 1.h,
                ),
                DefaultTextField(
                  hintText: 'Bio',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Bio is empty';
                    } else {
                      return null;
                    }
                  }, controller: bioController,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                DefaultText(
                  text: 'Address',
                  fontSize: 14.sp,
                  color: Colors.black26,
                ),
                SizedBox(
                  height: 1.h,
                ),
                DefaultTextField(
                  hintText: 'Address',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Address is empty';
                    } else {
                      return null;
                    }
                  }, controller: addressController,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                DefaultText(
                  text: 'Phone Number',
                  fontSize: 14.sp,
                  color: Colors.black26,
                ),
                SizedBox(
                  height: 1.h,
                ),
                IntlPhoneField(
                  controller: phoneNumberController,
                  initialCountryCode: 'EG',
                  validator: (value) {
                    if (value!.number.isEmpty) {
                      return 'phone number is empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  disableLengthCheck: true,
                  onChanged: (phone) {

                  },
                  onCountryChanged: (country) {
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                DefaultMaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      MyCache.putString(key: MyCacheKeys.fullName, value:fullNameController.text);
                      MyCache.putString(key: MyCacheKeys.bio, value: bioController.text);
                      MyCache.putString(key: MyCacheKeys.address, value: addressController.text);
                      MyCache.putString(key: MyCacheKeys.phoneNumber, value: phoneNumberController.text);
                    }
                    Navigator.pop(context);
                  },
                  backgroundColor: buttonColor,
                  child: const DefaultText(
                    text: 'Save',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}