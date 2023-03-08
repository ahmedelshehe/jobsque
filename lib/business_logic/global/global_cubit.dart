// ignore_for_file: unnecessary_import, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/presentation/screens/home_screens/home_screen.dart';
import 'package:meta/meta.dart';

import '../../presentation/screens/applied_jobs_screens/applied_jobs_screen.dart';
import '../../presentation/screens/messages_screens/messages_screen.dart';
import '../../presentation/screens/profile_screens/profile_screen.dart';
import '../../presentation/screens/saved_jobs_screens/saved_jobs_screen.dart';
import '../../presentation/view_models/job_notification_view_model.dart';
import '../../presentation/view_models/main_notification_view_model.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  static GlobalCubit get(context) => BlocProvider.of<GlobalCubit>(context);
  int screenCurrentIndex=0;
  int screenPreviousIndex=0;
  List<Widget> mainScreens=[
    const HomeScreen(),
    const MessagesScreen(),
    const AppliedJobsScreen(),
    const SavedJobsScreen(),
    const ProfileScreen()
  ];
  List<String> mainScreensTitles=[
    'Home','Messages','Applied','Saved','Profile'
  ];
  List<MainNotificationViewModel> allNotification=[
    MainNotificationViewModel(imagePath: 'assets/icons/facebook.svg',content: 'Posted new design jobs',date: DateTime(2023,2,26),time: const TimeOfDay(hour: 05, minute: 15),title: 'Facebook'),
    MainNotificationViewModel(imagePath: 'assets/icons/google.svg',content: 'Posted new design jobs',date: DateTime(2023,2,26),time: const TimeOfDay(hour: 05, minute: 15),title: 'Google'),
    MainNotificationViewModel(imagePath: 'assets/images/discord.svg',content: 'Posted new design jobs',date: DateTime(2023,2,26),time: const TimeOfDay(hour: 05, minute: 15),title: 'Discord'),
    MainNotificationViewModel(imagePath: 'assets/images/spectrum.svg',content: 'Posted new design jobs',date: DateTime(2023,2,25),time: const TimeOfDay(hour: 05, minute: 15),title: 'Spectrum'),
    MainNotificationViewModel(imagePath: 'assets/images/vk.svg',content: 'Posted new design jobs',date: DateTime(2023,2,25),time: const TimeOfDay(hour: 05, minute: 15),title: 'VK'),
    MainNotificationViewModel(imagePath: 'assets/images/invision.svg',content: 'Posted new design jobs',date: DateTime(2023,2,24),time: const TimeOfDay(hour: 05, minute: 15),title: 'Invision'),
    MainNotificationViewModel(imagePath: 'assets/images/twitter.svg',content: 'Posted new design jobs',date: DateTime(2023,2,23),time: const TimeOfDay(hour: 05, minute: 15),title: 'Twitter'),
    MainNotificationViewModel(imagePath: 'assets/images/email_sent.svg',content: 'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',date: DateTime(2023,2,23),time: const TimeOfDay(hour: 05, minute: 15),title: 'Email setup successful'),
    MainNotificationViewModel(imagePath: 'assets/images/password_changed.svg',content: 'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',date: DateTime(2023,2,14),time: const TimeOfDay(hour: 05, minute: 15),title: 'Welcome to Jobsque'),
  ];
  List<MainNotificationViewModel> newNotifications=[];
  List<MainNotificationViewModel> yesterdayNotifications=[];
  List<MainNotificationViewModel> pastNotifications=[];
  bool jobNotification=false;
  changeScreen(int index){
    emit(AppLoadingState());
    screenPreviousIndex=screenCurrentIndex;
    screenCurrentIndex=index;
    emit(ScreenChangedState());
  }
  JobNotificationViewModel notificationModel=JobNotificationViewModel(companyName: '', imagePath: '', status: JobNotificationStatus.applied);
  setJobNotification(JobNotificationViewModel model){
    emit(AppLoadingState());
    jobNotification=true;
    notificationModel =model;
    emit(JobNotificationAdded());
    Future.delayed(const Duration(seconds: 5),() {
      jobNotification=false;
    },);
  }
  sortMainNotifications(){
    emit(AppLoadingState());
    newNotifications =[];
    yesterdayNotifications =[];
    pastNotifications =[];
    for(MainNotificationViewModel notification in allNotification){
      if(notification.dateDays ==0){
        newNotifications.add(notification);
      }else if(notification.dateDays == 1){
        yesterdayNotifications.add(notification);
      }else{
        pastNotifications.add(notification);
      }
    }
    emit(MainNotificationsSortedState());
  }
}
