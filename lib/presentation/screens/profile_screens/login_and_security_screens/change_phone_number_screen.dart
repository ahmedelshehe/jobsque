import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/my_cache_keys.dart';
import '../../../../data/local/my_cache.dart';
import '../../../widgets/default_material_button.dart';
import '../../../widgets/default_text.dart';

class ChangePhoneNumberScreen extends StatefulWidget {
  const ChangePhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<ChangePhoneNumberScreen> createState() =>
      _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
  late bool _resetWithPhone;
  var formKey = GlobalKey<FormState>();
  late TextEditingController _phoneNumberController;
  @override
  void initState() {
    _resetWithPhone =true;
    _phoneNumberController = TextEditingController(text: MyCache.getString(key: MyCacheKeys.phoneNumber));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Phone Number',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IntlPhoneField(
                  controller: _phoneNumberController,
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
                  SwitchListTile(
                      subtitle: const Text('Use the phone number to reset your password'),
                      value: _resetWithPhone,
                      onChanged: (bool value) {
                        setState(() {
                          _resetWithPhone = value;
                        });
                      }
                  )
                ],
              ),
              DefaultMaterialButton(
                onPressed:() {
                  if(formKey.currentState!.validate()){
                    MyCache.putString(key: MyCacheKeys.phoneNumber, value: _phoneNumberController.text);
                    Navigator.pop(context);
                  }
                },
                backgroundColor: buttonColor,
                child: const DefaultText(
                  text: 'Save',
                  color:Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
