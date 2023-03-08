// ignore_for_file: unnecessary_import, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../presentation/view_models/saved_job_view_model.dart';

part 'saved_jobs_state.dart';

class SavedJobsCubit extends Cubit<SavedJobsState> {
  SavedJobsCubit() : super(SavedJobsInitial());
  static SavedJobsCubit get(context) => BlocProvider.of<SavedJobsCubit>(context);
  List<SavedJobViewModel> savedJobs=[];
  getSavedJobs(){
    emit(SavedJobsLoadingState());
    savedJobs=[
      SavedJobViewModel(
          jobTitle: 'Senior UI Designer',
          imagePath: 'assets/images/twitter.svg',
          companyName: 'Twitter',
          postDate: DateTime(2023, 2, 20),
          companyLocation: 'Jakarta, Indonesia'),
      SavedJobViewModel(
          jobTitle: 'UI Designer',
          imagePath: 'assets/images/spectrum.svg',
          companyName: 'Spectrum',
          postDate: DateTime(2023, 2, 25),
          companyLocation: 'Jakarta, Indonesia'),
      SavedJobViewModel(
          jobTitle: 'Senior UI Designer',
          imagePath: 'assets/images/vk.svg',
          companyName: 'VK',
          postDate: DateTime(2023, 2, 21),
          companyLocation: 'Jakarta, Indonesia'),
      SavedJobViewModel(
          jobTitle: 'Junior UI Designer',
          imagePath: 'assets/images/invision.svg',
          companyName: 'Invision',
          postDate: DateTime(2023, 2, 20),
          companyLocation: 'Jakarta, Indonesia'),
      SavedJobViewModel(
          jobTitle: 'Senior UX Designer',
          imagePath: 'assets/images/discord.svg',
          companyName: 'Discord',
          postDate: DateTime(2023, 2, 20),
          companyLocation: 'Jakarta, Indonesia'),
    ];
    emit(GetSavedJobsState());
  }
}
