import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text.dart';

class JobDescriptionView extends StatelessWidget {
  const JobDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 5.w),
      child: SizedBox(
        height: 50.h,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: 'Job Description',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                DefaultText(
                  text: 'Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
                DefaultText(
                  text: 'Skill Required',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                DefaultText(
                  text: 'A strong visual portfolio with clear understanding of UI methodologies Ability to create hi-fidelity mock-ups in Figma Ability to create various graphics for the web e.g. illustrations and icons Able to facilitate workshops and liaise with stakeholders Proficiency in the Adobe Creative SuiteConfident communicator with an analytical mindsetDesign library/Design system experience4+ years of commercial experience in UI/Visual Design',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}