import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/apply_job/apply_job_cubit.dart';
import '../../../constants/colors.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_field.dart';

class BioDataFormView extends StatefulWidget {
  const BioDataFormView({
    super.key,
  });

  @override
  State<BioDataFormView> createState() => _BioDataFormViewState();
}

class _BioDataFormViewState extends State<BioDataFormView> {

  var formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late ApplyJobCubit cubit;

  @override
  void initState() {
    cubit = ApplyJobCubit.get(context);
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text: 'Bio Data',
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 1.h,
          ),
          DefaultText(
            text: 'Fill in your bio data correctly',
            fontSize: 10.sp,
            fontWeight: FontWeight.w200,
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              DefaultText(
                text: 'Full Name',
                fontSize: 14.sp,
              ),
              const DefaultText(
                text: ' *',
                color: Colors.red,
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          DefaultTextField(
            hintText: 'Full Name',
            prefixIcon: const Icon(Icons.person_outlined),
            controller: fullNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Full Name is empty';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              DefaultText(
                text: 'Email',
                fontSize: 14.sp,
              ),
              const DefaultText(
                text: ' *',
                color: Colors.red,
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          DefaultTextField(
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email_outlined),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = RegExp(pattern);
                if (!regex.hasMatch(value!)) {
                  return 'Enter Valid Email';
                } else {
                  return null;
                }
              }),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              DefaultText(
                text: 'Phone Number',
                fontSize: 14.sp,
              ),
              const DefaultText(
                text: ' *',
                color: Colors.red,
              )
            ],
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
              cubit.phoneNumber = phone.completeNumber;
            },
            onCountryChanged: (country) {
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          DefaultMaterialButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Map<String, String> data = {
                  'fullName': fullNameController.text,
                  'email': emailController.text,
                  'phoneNumber': cubit.phoneNumber
                };
                cubit.setBioData(data);
              }
            },
            backgroundColor: buttonColor,
            child: const DefaultText(
              text: 'Next',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}