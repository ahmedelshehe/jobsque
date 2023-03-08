import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/presentation/view_models/personnel_view_model.dart';

import '../../presentation/views/job_details_views/company_view.dart';
import '../../presentation/views/job_details_views/description_view.dart';
import '../../presentation/views/job_details_views/people_view.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit() : super(JobDetailsInitial());
  static JobDetailsCubit get(context) => BlocProvider.of<JobDetailsCubit>(context);
  int currentIndex=0;
  List<String> positions=['UI/UX Design','Front end Developer','Backend developer','It Admin'];
  List<PersonnelViewModel> personnel=[
    PersonnelViewModel(name: 'Dimas Adi Saputro', years: 5,position: 'Senior UI/UX Designer ',),
    PersonnelViewModel(name: 'Syahrul Ramadhani', years: 4,position: 'Senior UI/UX Designer ',),
    PersonnelViewModel(name: 'Farrel Daniswara', years: 3,position: 'UI/UX Designer ',),
    PersonnelViewModel(name: 'Ahmed Ayman', years: 3,position: 'Senior UI/UX Designer ',),
    PersonnelViewModel(name: 'Said Abdo', years: 2,position: 'UI/UX Designer',),
    PersonnelViewModel(name: 'Mariam Ali', years: 2,position: 'Junior UI/UX Designer',),
  ];
  List<Widget> jobDetailsViews=[
    const JobDescriptionView(),
    const JobCompanyView(),
    const JobPeopleView()
  ];
  changeIndex(int index){
    emit(JobLoadingState());
    currentIndex=index;
    emit(JobViewIndexChangedState());
  }
}
