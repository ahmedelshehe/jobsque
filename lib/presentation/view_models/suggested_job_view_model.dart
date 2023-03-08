import 'package:flutter/material.dart';

class SuggestedJobViewModel{
  final Color itemColor;
  final Color itemTextColor;
  final Color itemSecondaryTextColor;
  final String imagePath;
  final String jobTitle;
  final String companyName;
  final String companyLocation;
  final String salary;
  final Color chipColor;
  final Color chipTextColor;
  final List<String> chipsText;
  final bool saved;
  SuggestedJobViewModel(
      {required this.saved,
        required this.itemSecondaryTextColor,
        required this.itemColor,
      required this.imagePath,
      required this.jobTitle,
      required this.companyName,
      required this.companyLocation,
      required this.salary,
      required this.chipColor,
      required this.chipTextColor,
      required this.chipsText,
        required this.itemTextColor});
}