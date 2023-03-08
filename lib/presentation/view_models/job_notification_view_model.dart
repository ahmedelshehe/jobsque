enum JobNotificationStatus{
  applied,
  accepted
}
class JobNotificationViewModel{
  final String companyName;
  final String imagePath;
  final JobNotificationStatus status;

  JobNotificationViewModel({required this.companyName, required this.imagePath, required this.status});
}