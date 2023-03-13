import 'package:flutter/material.dart';
import 'package:jobsque/constants/my_cache_keys.dart';
import 'package:jobsque/data/local/my_cache.dart';
import 'package:jobsque/presentation/screens/home_screens/home_screen.dart';
import 'package:jobsque/presentation/screens/home_screens/notifications_screen.dart';
import 'package:jobsque/presentation/screens/home_screens/search_job_screen.dart';
import 'package:jobsque/presentation/screens/home_screens/search_results_screen.dart';
import 'package:jobsque/presentation/screens/job_details_screens/apply_job_screen.dart';
import 'package:jobsque/presentation/screens/job_details_screens/job_details_screen.dart';
import 'package:jobsque/presentation/screens/main_layout.dart';
import 'package:jobsque/presentation/screens/profile_screens/add_portfolio_screen.dart';
import 'package:jobsque/presentation/screens/profile_screens/edit_profile_screen.dart';
import 'package:jobsque/presentation/screens/profile_screens/language_screen.dart';
import 'package:jobsque/presentation/screens/profile_screens/login_and_security_screen.dart';
import 'package:jobsque/presentation/screens/profile_screens/notifications_settings_screen.dart';
import 'package:jobsque/presentation/screens/registration_screens/choose_location_screen.dart';
import 'package:jobsque/presentation/screens/registration_screens/choose_roles_screen.dart';
import 'package:jobsque/presentation/screens/login_screen.dart';
import 'package:jobsque/presentation/screens/password_screens/new_password_screen.dart';
import 'package:jobsque/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:jobsque/presentation/screens/registration_screens/register_screen.dart';
import 'package:jobsque/presentation/screens/password_screens/reset_password_screen.dart';
import 'package:jobsque/constants/screens.dart' as screens;
import 'package:jobsque/presentation/screens/saved_jobs_screens/saved_jobs_screen.dart';
import 'package:jobsque/presentation/screens/success_screens/check_you_email_screen.dart';
import 'package:jobsque/presentation/screens/success_screens/password_changed_screen.dart';
import 'package:jobsque/presentation/screens/success_screens/successful_account_set_up_screen.dart';

class AppRouter{
  late Widget startScreen;
  Route? onGenerateRoute(RouteSettings settings){
    bool isOnBoardingViewed =MyCache.getBoolean(key: MyCacheKeys.isOnBoardingViewed);
    String token =MyCache.getString(key: MyCacheKeys.myToken);
    if(isOnBoardingViewed){
      if(token == ''){
        startScreen =const LoginScreen();
      }else{
        startScreen =const MainLayout();
      }
    }else{
      startScreen =const OnBoardingScreen();
    }
    switch(settings.name){
      case screens.startScreen:
        return MaterialPageRoute(builder: (_)=>startScreen);
      case screens.mainLayout:
        return MaterialPageRoute(builder: (_)=>const MainLayout());
      case screens.onBoardingScreen:
        return MaterialPageRoute(builder: (_)=>const OnBoardingScreen());
      case screens.loginScreen:
        return MaterialPageRoute(builder: (_)=>const LoginScreen());
      case screens.registerScreen:
        return MaterialPageRoute(builder: (_)=>const RegisterScreen());
      case screens.resetPasswordScreen:
        return MaterialPageRoute(builder: (_)=>const ResetPasswordScreen());
      case screens.newPasswordScreen:
        return MaterialPageRoute(builder: (_)=>const NewPasswordScreen());
      case screens.chooseRolesScreen:
        return MaterialPageRoute(builder: (_)=>const ChooseRolesScreen());
      case screens.chooseLocationScreen:
        return MaterialPageRoute(builder: (_)=>const ChooseLocationScreen());
      case screens.successfulAccountSetUpScreen:
        return MaterialPageRoute(builder: (_)=>const SuccessfulAccountSetUpScreen());
      case screens.checkYourEmailScreen:
        return MaterialPageRoute(builder: (_)=>const CheckYourEmailScreen());
      case screens.passwordChangedScreen:
        return MaterialPageRoute(builder: (_)=>const PasswordChangedScreen());
      case screens.homeScreen:
        return MaterialPageRoute(builder: (_)=>const HomeScreen());
      case screens.searchJobScreen:
        return MaterialPageRoute(builder: (_)=>const SearchJobScreen());
      case screens.searchResultsScreen:
        return MaterialPageRoute(builder: (_)=> SearchResultsScreen(searchTerm: settings.arguments as String,));
      case screens.jobDetailsScreen:
        return MaterialPageRoute(builder: (_)=>const JobDetailsScreen());
      case screens.applyJobScreen:
        return MaterialPageRoute(builder: (_)=>const ApplyJobScreen());
      case screens.savedJobsScreen:
        return MaterialPageRoute(builder: (_)=>const SavedJobsScreen());
      case screens.notificationScreen:
        return MaterialPageRoute(builder: (_)=>const NotificationsScreen());
      case screens.editProfileScreen:
        return MaterialPageRoute(builder: (_)=>const EditProfileScreen());
      case screens.addPortfolioScreen:
        return MaterialPageRoute(builder: (_)=>const AddPortfolioScreen());
      case screens.languageScreen:
        return MaterialPageRoute(builder: (_)=>const LanguageScreen());
      case screens.notificationsSettingsScreen:
        return MaterialPageRoute(builder: (_)=>const NotificationSettingsScreen());
      case screens.loginAndSecurityScreen:
        return MaterialPageRoute(builder: (_)=>const LoginAndSecurityScreen());
    }
    return null;
  }
}