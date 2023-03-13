import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/business_logic/search/search_cubit.dart';
import 'package:jobsque/presentation/app_router.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/apply_job/apply_job_cubit.dart';
import 'business_logic/auth/auth_cubit.dart';
import 'business_logic/global/global_cubit.dart';
import 'business_logic/job_details/job_details_cubit.dart';
import 'business_logic/saved_jobs/saved_jobs_cubit.dart';
import 'constants/bloc_observer.dart';
import 'data/local/my_cache.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false,create: (context) => SearchCubit()..createDatabase()),
        BlocProvider(create: (context) => JobDetailsCubit(),),
        BlocProvider(lazy:true,create: (context) => ApplyJobCubit(),),
        BlocProvider(create: (context) => GlobalCubit(),),
        BlocProvider(lazy:true,create: (context) => SavedJobsCubit(),),
        BlocProvider(create: (context) => AuthCubit(),),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Jobsque',
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          }),
    );
  }
}
