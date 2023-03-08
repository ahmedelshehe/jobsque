import 'package:flutter/material.dart';
import 'package:jobsque/presentation/views/search_views/search_job_bar.dart';
import 'package:jobsque/presentation/widgets/default_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/search/search_cubit.dart';
import '../../../constants/screens.dart';
import '../../views/search_views/filters_bar_view.dart';
import '../../views/search_views/full_filters_modal_sheet.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key, required this.searchTerm})
      : super(key: key);
  final String searchTerm;
  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late TextEditingController _searchController;
  var formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _locationController;
  late SearchCubit cubit;
  final GlobalKey<FormFieldState> _dropDownMenukey =
      GlobalKey<FormFieldState>();
  @override
  void initState() {
    _searchController = TextEditingController(text: widget.searchTerm);
    _titleController = TextEditingController(text: widget.searchTerm);
    _locationController = TextEditingController();
    cubit = SearchCubit.get(context);
    super.initState();
  }

  @override
  void dispose() {
    cubit.searchedTerm = widget.searchTerm;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchJobBar(
              formKey: formKey,
              searchController: _searchController,
              onFieldSubmitted: (value) {
                cubit.insertToSearches(name: value);
                Navigator.of(context)
                    .pushNamed(searchResultsScreen, arguments: value);
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: GestureDetector(
                    onTap: () => showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return FullFiltersModalSheet(titleController: _titleController, locationController: _locationController, searchController: _searchController, dropDownMenukey: _dropDownMenukey, cubit: cubit);
                      },
                    ),
                    child:
                        const DefaultSVG(imagePath: 'assets/icons/filters.svg'),
                  ),
                ),
                FiltersBarView(cubit: cubit)
              ],
            )
          ],
        ),
      ),
    );
  }
}


