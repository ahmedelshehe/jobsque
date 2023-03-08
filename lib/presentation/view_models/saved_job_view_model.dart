class SavedJobViewModel{
  final String jobTitle;
  final String imagePath;
  final String companyName;
  final DateTime postDate;
  final String companyLocation;
  late String postDateDays=DateTime.now().difference(postDate).inDays ==0 ? 'posted today' :'posted ${DateTime.now().difference(postDate).inDays} days ago';
  SavedJobViewModel(
      {required this.jobTitle,
      required this.imagePath,
      required this.companyName,
      required this.postDate,
      required this.companyLocation}

);
}