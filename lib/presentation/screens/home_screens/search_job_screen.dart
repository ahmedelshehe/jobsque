import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/business_logic/search/search_cubit.dart';
import 'package:jobsque/constants/screens.dart';
import 'package:jobsque/presentation/views/search_views/job_searches.dart';
import 'package:jobsque/presentation/views/search_views/search_job_bar.dart';
class SearchJobScreen extends StatefulWidget {
  const SearchJobScreen({Key? key}) : super(key: key);

  @override
  State<SearchJobScreen> createState() => _SearchJobScreenState();

}

class _SearchJobScreenState extends State<SearchJobScreen> {
  late TextEditingController _searchController;
  var formKey = GlobalKey<FormState>();
  late SearchCubit cubit;

  @override
  void initState() {
    cubit=SearchCubit.get(context);
    _searchController=TextEditingController(text: cubit.searchedTerm);
    super.initState();
  }
  @override
  void dispose() {
    cubit.searchedTerm='';
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if(state is AppLoadingState || state is AppDeleteSearchState || state is AppInsertSearchState){
          return const Center(child: Text('Searching'),);
        }
        else{
          return SingleChildScrollView(
            child: Column(
              children: [
                SearchJobBar(formKey: formKey, searchController: _searchController,
                    onFieldSubmitted: (value) {
                      cubit.searchJob(value);
                      cubit.insertToSearches(name: value);
                      Navigator.of(context).pushNamed(
                        searchResultsScreen, arguments: value,);
                      }
                    ),
                const JobSearches(),
              ],
            ),
          );
        }
      },
),
    );
  }
}
