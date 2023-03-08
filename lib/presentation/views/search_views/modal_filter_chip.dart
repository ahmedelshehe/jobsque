import 'package:flutter/material.dart';
import 'package:jobsque/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/search/search_cubit.dart';

class ModalFilterChip extends StatelessWidget {
  const ModalFilterChip({
    super.key,
    required this.cubit,
    required this.chipValue,required this.onSelected, required this.selected,
  });

  final SearchCubit cubit;
  final String chipValue;
  final void Function(bool) onSelected;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(chipValue),
      onSelected: onSelected,
      selected:selected ,
      showCheckmark: false,
      backgroundColor: Colors.transparent,
      side: BorderSide(
        color: Colors.grey.withOpacity(0.3),
      ),
      selectedColor: selectedTileColor.withOpacity(0.8),
      padding: EdgeInsets.all(10.sp),
    );
  }
}