import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);
  bool editing=false;
  String searchedTerm ='';
  List locationType=[];
  List jobType=[];
  List postDateTypes=[];
  List jobLevels=[];
  String salaryRange='All';
  List<String> salaryRanges=['All','\$5K-\$10K','\$10K-\$15K','\$15K-\$25K','\$25K-\$50K'];
  List<Map> recentSearches=[];
  List<String> popularSearches=['Project Manager','UI/UX Designer','Front-End Developer','Junior UI Designer','Junior UX Designer'];
  late Database database;
  void createDatabase(){
    openDatabase(
      'jobsque.db',
      version: 1,
      onCreate: (database, version) {
        if (kDebugMode) {
          print('database created');
        }
        database.execute('CREATE TABLE searches (id INTEGER PRIMARY KEY, text TEXT)')
            .then((value) {
          if (kDebugMode) {
            print('table created');
          }
        }).catchError((error){
          if (kDebugMode) {
            print('Error while creating table $error');
          }
        });
      },
        onOpen: (database){
          getSearches(database);
          if (kDebugMode) {
            print('database opened');
          }
        }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }
  Future<void> getSearches (Database database) async{
    emit(AppLoadingState());
    recentSearches = [];

    await database.rawQuery('SELECT * FROM searches').then((value) {
      for (var element in value) {
        recentSearches.add(element);
      }
    });
    emit(AppGetDatabaseState());
  }
  Future<void> insertToSearches({required String name,}) async{
    emit(AppLoadingState());
    await database.transaction((txn) {
      return txn.rawInsert('INSERT INTO searches(text) VALUES("$name")')
          .then((value) {
        if (kDebugMode) {
          print('search for  $value successfully inserted!');
        }
        emit(AppInsertSearchState());
        getSearches(database);
      }).catchError((error){
        if (kDebugMode) {
          print('Error while inserting Contact $error');
        }
      });
    });
  }
  Future<void> searchJob(String text) async {
    emit(AppLoadingState());
    searchedTerm=text;
    emit(SearchJobState());
    await getSearches(database);
  }
  Future<void> deleteSearch({required int id,}) async{
    await database.rawDelete('DELETE FROM searches WHERE id = ?',
      [id],
    ).then((value) {
      emit(AppDeleteSearchState());
      getSearches(database);
    });
  }
  addOrRemoveLocationType(String text){
    emit(AppLoadingState());
    if(text =='Any' && !locationType.contains(text)){
      locationType.clear();
      locationType.add(text);
    }else if(text =='Any' && locationType.contains(text)){
      locationType.remove(text);
    }else{
      locationType.remove('Any');
      if(locationType.contains(text)){
        locationType.remove(text);
      }else{
        locationType.add(text);
      }
    }
    emit(SearchLocationTypeEditedState());
  }
  addOrRemoveJobType(String text){
    emit(AppLoadingState());
    if(jobType.contains(text)){
      jobType.remove(text);
    }else{
      jobType.add(text);
    }
    emit(SearchJobTypeEditedState());
  }
  addOrRemovePostDateType(String text){
    emit(AppLoadingState());
    if(text=='All'&& !postDateTypes.contains(text)){
      postDateTypes.clear();
      postDateTypes.add(text);
    }else if(text=='All'&& postDateTypes.contains(text)){
      postDateTypes.remove(text);
    }else{
      postDateTypes.remove('All');
      if(postDateTypes.contains(text)){
        postDateTypes.remove(text);
      }else{
        postDateTypes.add(text);
      }
    }

    emit(SearchPostDateEditedState());
  }
  addOrRemoveJobLevel(String text){
    emit(AppLoadingState());
      if(jobLevels.contains(text)){
        jobLevels.remove(text);
      }else{
        jobLevels.add(text);
      }
    emit(SearchJobLevelsEditedState());
  }
  resetFilters(){
    emit(AppLoadingState());
     locationType=[];
     jobType=[];
     postDateTypes=[];
     jobLevels=[];
     salaryRange='All';
     emit(SearchFiltersResetState());
  }
}
