import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/business_logic/apply_job/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/colors.dart';
import '../../views/apply_job_views/apply_job_progress_bar.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../success_screens/succesful_apply_job_screen.dart';

class ApplyJobScreen extends StatefulWidget {
  const ApplyJobScreen({Key? key}) : super(key: key);

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  late ApplyJobCubit cubit;
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController=ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cubit = ApplyJobCubit.get(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocConsumer<ApplyJobCubit, ApplyJobState>(
        listener: (context, state) {
          if(state is NextStepState){
            scrollController.animateTo(0,
                duration: const Duration(milliseconds: 500), curve: Curves.ease);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 10.h,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const DefaultText(
                text: 'Apply Job',
                color: Colors.black,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              controller: scrollController,
              child: Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ApplyJobProgressBar(cubit: cubit),
                    SizedBox(
                      height: 3.h,
                    ),
                    cubit.views[cubit.currentStep]
                  ],
                ),
              ),
            ),
            floatingActionButton: Visibility(
              visible: cubit.currentStep != 0,
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Visibility(
                  visible: cubit.currentStep==1,
                  replacement: DefaultMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const ApplyJobSuccessScreen();
                    },));
                  },
                  backgroundColor: buttonColor,
                  child: const DefaultText(
                    text: 'Submit',
                    color: Colors.white,
                  ),
                ),
                  child: DefaultMaterialButton(
                    onPressed: () =>cubit.nextStep(),
                    backgroundColor: buttonColor,
                    child: const DefaultText(
                      text: 'Next',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerFloat,
          );
        },
      ),
    );
  }
}





