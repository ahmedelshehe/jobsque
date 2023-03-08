import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../widgets/default_svg.dart';

class ChooseRoleView extends StatefulWidget {
  const ChooseRoleView({Key? key, required this.titles, required this.roles}) : super(key: key);
  final Map<String, String> roles;
  final List<String> titles;

  @override
  State<ChooseRoleView> createState() => _ChooseRoleViewState();
}

class _ChooseRoleViewState extends State<ChooseRoleView> {
  @override
  Widget build(BuildContext context) {
    return  GridView(
      shrinkWrap: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.25),
      children: widget.roles.keys.map((role) {
        return FilterChip(
          disabledColor: unSelectedTileColor,
          showCheckmark: false,
          selectedColor: selectedTileColor,
          selected: widget.titles.contains(role),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                if (!widget.titles.contains(role)) {
                  widget.titles.add(role);
                }
              } else {
                widget.titles.removeWhere((String name) {
                  return name == role;
                });
              }
            });
          },
          label: SizedBox(
            width: 35.w,
            height: 15.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: widget.titles.contains(role)
                          ? Colors.white
                          : null
                  ),
                  child: DefaultSVG(
                    imagePath: widget.roles[role]!,
                    color: widget.titles.contains(role)
                        ? Colors.blueAccent
                        : null,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: Text(
                    role,
                    style: TextStyle(fontSize: 14.sp),
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // new
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: unSelectedTileColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                  color: widget.titles.contains(role)
                      ? Colors.blueAccent
                      : Colors.black12)),
        );
      }).toList(),
    );
  }
}
