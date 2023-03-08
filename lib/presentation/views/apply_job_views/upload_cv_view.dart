import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/presentation/widgets/default_material_button.dart';
import 'package:jobsque/presentation/widgets/default_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/apply_job/apply_job_cubit.dart';
import '../../../constants/colors.dart';
import '../../widgets/default_text.dart';

class UploadCvView extends StatefulWidget {
  const UploadCvView({Key? key}) : super(key: key);
  @override
  State<UploadCvView> createState() => _UploadCvViewState();
}

class _UploadCvViewState extends State<UploadCvView> {
  FilePickerResult? result;
  late ApplyJobCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=BlocProvider.of<ApplyJobCubit>(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyJobCubit, ApplyJobState>(
  builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: 'Upload portfolio',
          fontSize: 20.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 1.h,
        ),
        DefaultText(
          text: 'Upload CV File',
          fontSize: 10.sp,
          fontWeight: FontWeight.w200,
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(
          children: [
            DefaultText(
              text: 'Upload CV',
              fontSize: 14.sp,
            ),
            const DefaultText(
              text: ' *',
              color: Colors.red,
            )
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const DefaultSVG(imagePath: 'assets/icons/pdf.svg'),
                  SizedBox(width: 5.sp,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'Rafi Dian.CV',
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      DefaultText(
                        text: 'CV.pdf 300KB',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w200,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.blue),),),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      )),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Container(
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(50.sp),
                        border: Border.all(color: Colors.red)
                      ),
                      child: const Icon(
                        Icons.close_outlined,
                        color: Colors.red,
                      ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        DefaultText(
          text: 'Other File',
          fontSize: 14.sp,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
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
      ],
    );
  },
);
  }
}
