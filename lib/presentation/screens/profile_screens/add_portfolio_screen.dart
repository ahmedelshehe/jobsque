import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/apply_job/apply_job_cubit.dart';
import '../../../constants/colors.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';

class AddPortfolioScreen extends StatefulWidget {
  const AddPortfolioScreen({Key? key}) : super(key: key);

  @override
  State<AddPortfolioScreen> createState() => _AddPortfolioScreenState();
}

class _AddPortfolioScreenState extends State<AddPortfolioScreen> {
  late ApplyJobCubit cubit;
  FilePickerResult? result;
  @override
  void initState() {
    cubit=ApplyJobCubit.get(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Portfolio',
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: DefaultText(
                text: 'Add portfolio here',
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                  width: 90.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue,),
                    borderRadius: BorderRadius.circular(10.sp),
                    color: selectedTileColor,
                  ),
                  child: Column(
                    children:  [
                      Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(50.sp),
                            color: Colors.black12
                        ),
                        child: Icon(
                          Icons.upload_file_rounded,
                          color: buttonColor,
                          size: 25.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultText(
                        text:cubit.fileSelected? cubit.filePath :'Upload your other file',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DefaultText(
                        text: 'Max. file size 10 MB',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w200,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: DefaultMaterialButton(
                          onPressed: () async{
                            result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf','doc','docx'],
                            );
                            if (result != null) {
                              cubit.fileSelected=false;
                              cubit.setSelectedFile(File(result!.files.single.path!));
                            } else {
                              // User canceled the picker
                            }
                          },
                          backgroundColor: selectedTileColor,
                          elevation: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.cloud_upload_outlined,color: buttonColor,),
                              SizedBox(width: 5.sp,),
                              DefaultText(
                                text: 'Add File',
                                fontSize: 14.sp,
                                color: buttonColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),
            SizedBox(height: 1.h,),
            SizedBox(
              height: 70.h,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    margin:EdgeInsets.symmetric(horizontal: 5.w,),
                    padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 1.h),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10.sp)
                    ),
                    child: ListTile(
                      leading: const DefaultSVG(imagePath: 'assets/icons/pdf.svg',),
                      title: DefaultText(text: cubit.portfolioOptions.elementAt(index)['name']!,),
                      subtitle: DefaultText(text: cubit.portfolioOptions.elementAt(index)['fileName']!,),
                      trailing: SizedBox(
                        width: 25.w,
                        child: Row(
                          children: [
                            IconButton(onPressed: () {}, icon: const Icon(Icons.edit_document,color: Colors.blueAccent,)),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.delete,color: Colors.red,)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 1.h,);
                },
                itemCount: cubit.portfolioOptions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
