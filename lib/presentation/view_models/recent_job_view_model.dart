class RecentJobViewModel{
  final String jobTitle;
  final String companyName;
  final String imagePath;
  final String companyLocation;
  final String salary;
  final bool saved;
  final List<String> chipsText;
  RecentJobViewModel(
      {required this.jobTitle,
      required this.companyName,
      required this.imagePath,
      required this.companyLocation,
      required this.salary,
      required this.saved,
        required this.chipsText
      });
}