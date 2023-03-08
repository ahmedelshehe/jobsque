import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/search/search_cubit.dart';
import '../../../constants/colors.dart';
import '../../../constants/search_filters.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_button.dart';
import '../../widgets/default_text_field.dart';
import 'modal_filter_chip.dart';

class FullFiltersModalSheet extends StatelessWidget {
  const FullFiltersModalSheet({
    super.key,
    required TextEditingController titleController,
    required TextEditingController locationController,
    required TextEditingController searchController,
    required GlobalKey<FormFieldState> dropDownMenukey,
    required this.cubit,
  }) : _titleController = titleController, _locationController = locationController, _searchController = searchController, _dropDownMenukey = dropDownMenukey;

  final TextEditingController _titleController;
  final TextEditingController _locationController;
  final TextEditingController _searchController;
  final GlobalKey<FormFieldState> _dropDownMenukey;
  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SizedBox(
          height: 85.h,
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () =>
                          Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back)),
                  DefaultText(
                    text: 'Set Filter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  DefaultTextButton(
                      onPressed: () {
                        _titleController.clear();
                        _locationController.clear();
                        _searchController.clear();
                        _dropDownMenukey.currentState?.reset();
                        cubit.resetFilters();
                      },
                      child: DefaultText(
                        text: 'Reset',
                        color: Colors.blue,
                        fontSize: 14.sp,
                      ))
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  DefaultText(
                    text: 'Job Title',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 5.w),
                child: DefaultTextField(
                  controller: _titleController,
                  prefixIcon: const Icon(Icons.cases_outlined),
                  hintText: 'Job Title',
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  DefaultText(
                    text: 'Location',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 5.w),
                child: DefaultTextField(
                  controller: _locationController,
                  prefixIcon: const Icon(Icons.pin_drop_outlined),
                  hintText: 'Job Location',
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  DefaultText(
                    text: 'Salary',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 5.w),
                child: DropdownButtonFormField(
                  key: _dropDownMenukey,
                  menuMaxHeight: 50.h,
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.black26,
                    prefixIcon: const Icon(
                        Icons.monetization_on_outlined),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black38)),
                    hintText: 'Salary Range',
                    hintStyle: const TextStyle(
                        color: Colors.black26),
                  ),
                  style:
                  const TextStyle(color: Colors.black),
                  items: cubit.salaryRanges.map((range) {
                    return DropdownMenuItem(
                      onTap: () {
                        cubit.salaryRange = range;
                      },
                      value:
                      cubit.salaryRanges.indexOf(range),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 60.w,
                            child: DefaultText(
                              text: range,
                              fontSize: 14.sp,
                              overflow:
                              TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (Object? value) {},
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  DefaultText(
                    text: 'Job Type',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 10.sp,
                children: jobTypeOptions
                    .map((type) => Wrap(
                  children: [
                    ModalFilterChip(
                      cubit: cubit,
                      chipValue: type,
                      onSelected: (bool value) {
                        cubit.addOrRemoveJobType(
                            type);
                      },
                      selected: cubit.jobType
                          .contains(type),
                    ),
                    SizedBox(
                      width: 2.w,
                    )
                  ],
                ))
                    .toList(),
              ),
              const Spacer(),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 5.w),
                child: DefaultMaterialButton(
                  onPressed:(){},
                  backgroundColor: buttonColor,
                  child: const DefaultText(
                    text: 'Show Results',
                    color:Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        );
      },
    );
  }
}