import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/business_logic/search/search_cubit.dart';
import 'package:sizer/sizer.dart';

class SearchJobBar extends StatefulWidget {
  const SearchJobBar({
    super.key,
    required this.formKey,
    required TextEditingController searchController,
    required this.onFieldSubmitted,
  }) : _searchController = searchController;

  final GlobalKey<FormState> formKey;
  final TextEditingController _searchController;
  final void Function(String) onFieldSubmitted;

  @override
  State<SearchJobBar> createState() => _SearchJobBarState();
}

class _SearchJobBarState extends State<SearchJobBar> {
  late SearchCubit cubit;

  @override
  void initState() {
    cubit = SearchCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: 7.h,
          ),
          child: SizedBox(
            width: 100.w,
            height: 6.5.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back)),
                SizedBox(
                  width: 82.w,
                  child: Form(
                    key: widget.formKey,
                    child: TextFormField(
                      autofocus: false,
                      controller: widget._searchController,
                      onFieldSubmitted: widget.onFieldSubmitted,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          cubit.editing = false;
                        } else {
                          cubit.editing = true;
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            CupertinoIcons.search,
                            color: Colors.black,
                          ),
                          suffixIcon: Visibility(
                            visible: cubit.editing,
                            child: IconButton(
                              icon: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Icon(
                                  Icons.close_outlined,
                                  color: Colors.black,
                                  size: 14.sp,
                                ),
                              ),
                              onPressed: () => widget._searchController.clear(),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                            borderSide: BorderSide(
                                width: 1.sp,
                                color: Colors.grey.withOpacity(0.5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                            borderSide: BorderSide(
                              width: 1.sp,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          hintText: 'Type Something ...',
                          hintStyle: const TextStyle(color: Colors.black12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
