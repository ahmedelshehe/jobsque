import 'package:flutter/material.dart';
import 'package:jobsque/constants/my_cache_keys.dart';
import 'package:jobsque/presentation/views/list_view_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../data/local/my_cache.dart';
import '../../widgets/default_text.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  late bool jobAlertSetting;
  late bool jobApplicationUpdateSetting;
  late bool jobApplicationRemindersSetting;
  late bool jobsYouMayBeInterestedInSetting;
  toggleSetting(MyCacheKeys key){
    setState(() {
      MyCache.putBoolean(key: key, value: !MyCache.getBoolean(key: key));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Notification',
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
      body: ListView(
        children:  const [
          ListViewBar(text: 'Job notification'),
          SettingsListTile(title: 'Your Job Search Alert',tileKey:MyCacheKeys.jobSearchAlertSetting),
          SettingsListTile(title: 'Job Application Update',tileKey:MyCacheKeys.jobApplicationUpdateSetting),
          SettingsListTile(title: 'Job Application Reminders',tileKey:MyCacheKeys.jobApplicationRemindersSetting),
          SettingsListTile(title: 'Jobs You May Be Interested In',tileKey:MyCacheKeys.jobsYouMayBeInterestedInSetting),
          SettingsListTile(title: 'Job Seeker Updates',tileKey:MyCacheKeys.jobSeekerUpdateSetting),
          SettingsListTile(title: 'Your Job Search Alert',tileKey:MyCacheKeys.jobSearchAlertSetting),
          ListViewBar(text: 'Other notification'),
          SettingsListTile(title: 'Show Profile',tileKey:MyCacheKeys.showProfileSetting),
          SettingsListTile(title: 'All Messages',tileKey:MyCacheKeys.allMessagesSetting),
          SettingsListTile(title: 'Message Nudges',tileKey:MyCacheKeys.messageNudgesSetting),
        ],
      ),
    );
  }
}

class SettingsListTile extends StatefulWidget {
  const SettingsListTile({
    super.key, required this.tileKey, required this.title,
  });
  final String title;
  final MyCacheKeys tileKey;

  @override
  State<SettingsListTile> createState() => _SettingsListTileState();
}

class _SettingsListTileState extends State<SettingsListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(value: MyCache.getBoolean(key: widget.tileKey),
          onChanged: (value) {
            setState(() {
              MyCache.putBoolean(key: widget.tileKey, value: !MyCache.getBoolean(key: widget.tileKey));
            });
          },
          title:  DefaultText(text: widget.title,fontSize: 13.sp,),
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.sp),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: Divider(color: Colors.black12,thickness: 0.5.sp,),
        )
      ],
    );
  }
}
