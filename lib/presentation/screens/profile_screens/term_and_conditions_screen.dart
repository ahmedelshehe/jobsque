import 'package:flutter/material.dart';

import '../../widgets/default_text.dart';

class TermAndConditionsScreen extends StatefulWidget {
  const TermAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermAndConditionsScreen> createState() => _TermAndConditionsScreenState();
}

class _TermAndConditionsScreenState extends State<TermAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Terms & Conditions',
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
    );
  }
}
