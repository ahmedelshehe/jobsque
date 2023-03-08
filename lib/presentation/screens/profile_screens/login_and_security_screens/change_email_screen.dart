import 'package:flutter/material.dart';
import 'package:jobsque/constants/my_cache_keys.dart';
import 'package:jobsque/data/local/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';
import '../../../widgets/default_material_button.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_field.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({Key? key}) : super(key: key);

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  @override
  void initState() {
    _emailController = TextEditingController(text: MyCache.getString(key: MyCacheKeys.myEmail));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Email address',
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
              DefaultTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
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
                  },
                  onChanged: (value) {}),
              DefaultMaterialButton(
                onPressed:() {
                  if(formKey.currentState!.validate()){
                    MyCache.putString(key: MyCacheKeys.myEmail, value: _emailController.text);
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
