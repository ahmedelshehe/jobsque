import 'package:flutter/material.dart';

class MainNotificationViewModel{
  final String title;
  final String content;
  final String imagePath;
  final DateTime date;
  late int dateDays=DateTime.now().difference(date).inDays;
  final TimeOfDay time;

  MainNotificationViewModel(
      {required this.title,required this.content,required this.imagePath,required this.date,required this.time});
}