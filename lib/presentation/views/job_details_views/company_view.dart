import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text.dart';

class JobCompanyView extends StatelessWidget {
  const JobCompanyView({Key? key}) : super(key: key);

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
                  text: 'Contact Us',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.sp),
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color: Colors.black12)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: 'Email',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black26,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          DefaultText(
                            text: 'twitter@mail.com',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Container(
                      padding: EdgeInsets.all(5.sp),
                      width: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(color: Colors.black12)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: 'Website',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black26,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          DefaultText(
                            text: 'https://twitter.com',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            DefaultText(
              text: 'About Company',
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
              text: 'Understanding Recruitment is an award-winning technology, software and digital recruitment consultancy with headquarters in St. Albans, Hertfordshire.We also have a US office in Boston, Massachusetts specialising in working closely with highly skilled individuals seeking their next career move within Next Gen Tech, Backend Engineering, and Artificial Intelligence.We recently celebrated our first decade in business and over the years have been recognised with several industry awards including \'Best Staffing Firm to Work For 2018\'​ at the SIA Awards for the third consecutive year and ‘Business of the Year 2017’ at the SME Hertfordshire Business Awards.Our teams of specialists operate across all areas of Technology and Digital, including Java, JavaScript, Python, .Net, DevOps & SRE, SDET, Artificial Intelligence, Machine Learning, AI, Digital, Quantum Computing, Hardware Acceleration, Digital, Charity, Fintech, and the Public Sector.',
              fontSize: 11.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
