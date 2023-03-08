import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/search/search_cubit.dart';
import '../../../constants/colors.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import 'default_modal_sheet.dart';
import 'modal_filter_chip.dart';

class FilterModalSheetContent extends StatelessWidget {
  const FilterModalSheetContent({
    super.key,
    required this.options,
    required this.cubit,
    required this.title,
    required this.types, required this.addOrRemoveFunction,
  });

  final List<String> options;
  final SearchCubit cubit;
  final String title;
  final List types;
  final Function(String) addOrRemoveFunction;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return DefaultModalSheet(
          title: title,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 10.sp,
              children: options
                  .map((type) => Wrap(
                children: [
                  ModalFilterChip(
                    cubit: cubit,
                    chipValue: type,
                    onSelected: (bool value) {
                      addOrRemoveFunction(type);
                    },
                    selected: types.contains(type),
                  ),
                  SizedBox(
                    width: 2.w,
                  )
                ],
              ))
                  .toList(),
            ),
            SizedBox(height: 5.h,),
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
        );
      },
    );
  }
}

