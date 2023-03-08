// ignore_for_file: unnecessary_import, depend_on_referenced_packages

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/presentation/views/apply_job_views/bio_data_form_view.dart';
import 'package:jobsque/presentation/views/apply_job_views/choose_portfolio_view.dart';
import 'package:jobsque/presentation/views/apply_job_views/upload_cv_view.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit() : super(ApplyJobInitial());
  static ApplyJobCubit get(context) => BlocProvider.of<ApplyJobCubit>(context);
  int currentStep=0;
  List<Widget> views=[
    const BioDataFormView(),
    const ChoosePortfolioView(),
    const UploadCvView()
  ];
  nextStep(){
    emit(ApplyJobLoadingState());
    currentStep +=1;
    emit(NextStepState());
  }
  Map<String,String> bioData={
    'fullName' : '',
    'email' : '',
    'phoneNumber':''
  };
  String phoneNumber='';
  List<Map<String,String>> portfolioOptions=[
    {'name':'Senior UX Designer', 'fileName':'cv.pdf'},
    {'name':'Senior UI Designer', 'fileName':'portfolio.pdf'},
    {'name':'Graphic Designer', 'fileName':'cv.pdf'},
    {'name':'Front-End Developer', 'fileName':'portfolio.pdf'},
  ];
  int portfolioIndex=0;
  bool fileSelected=false;
  String filePath='';
  setBioData(Map<String,String> data){
    emit(ApplyJobLoadingState());
    bioData=data;
    nextStep();
    emit(BioDataSavedState());
  }
  setSelectedPortfolio(int index){
    emit(ApplyJobLoadingState());
    portfolioIndex=index;
    emit(SelectedPortfolioState());
  }
  setSelectedFile(File cvSelected){
    emit(ApplyJobLoadingState());
    fileSelected=true;
    filePath=basename(cvSelected.path);
    emit(CVFileSelectedState());
  }
}
