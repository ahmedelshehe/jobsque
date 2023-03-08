import 'package:flutter/material.dart';
import 'package:jobsque/business_logic/global/global_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../view_models/main_notification_view_model.dart';
import '../../views/list_view_bar.dart';
import '../../views/notifications_views/no_notifications_view.dart';
import '../../views/notifications_views/notification_list_tile.dart';
import '../../views/notifications_views/past_notification_list_tile.dart';
import '../../widgets/default_text.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late GlobalCubit cubit;
  @override
  void initState() {
    cubit=GlobalCubit.get(context);
    cubit.sortMainNotifications();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Notifications',
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
      body: Visibility(
        visible: cubit.allNotification.isNotEmpty,
        replacement: const NoNotificationsView(),
        child: ListView(
          padding: EdgeInsets.only(bottom: 10.h),
          children: [
            ...?buildNotifications(cubit.newNotifications,'New'),
            ...?buildNotifications(cubit.yesterdayNotifications,'Yesterday'),
            ...?buildPastNotifications(cubit.pastNotifications)
          ],
        ),
      ),
    );
  }
}

List<Widget>? buildNotifications(List<MainNotificationViewModel> models,String title){
  if(models.isEmpty){
    return [const SizedBox.shrink()];
  }
  List<Widget> widgets=[];
  widgets.add(ListViewBar(text: title,));
  for(MainNotificationViewModel model in models){
    widgets.add(NotificationListTile(model: model));
  }
  return widgets;
}
List<Widget>? buildPastNotifications(List<MainNotificationViewModel> models){
  if(models.isEmpty){
    return [const SizedBox.shrink()];
  }
  List<Widget> widgets=[];
  widgets.add(const ListViewBar(text: 'Past Notifications',));
  for(MainNotificationViewModel model in models){
    widgets.add(PastNotificationListTile(model: model));
  }
  return widgets;
}

