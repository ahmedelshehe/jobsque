import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';

class DefaultModalSheet extends StatefulWidget {
  const DefaultModalSheet({
    super.key,
    required this.children,
    this.title,
  });
  final String? title;
  final List<Widget> children;

  @override
  State<DefaultModalSheet> createState() => _DefaultModalSheetState();
}

class _DefaultModalSheetState extends State<DefaultModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: const DefaultSVG(imagePath: 'assets/icons/drag_bar.svg'),
          ),
          buildDefaultText(),

          ...widget.children
        ],
      ),
    );
  }

  Widget buildDefaultText() {
    if(widget.title !=null){
      return Column(
        children: [
          DefaultText(
            text: widget.title!,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 4.h,
          ),
        ],
      );
    }else{
      return const SizedBox.shrink();
    }
  }
}
