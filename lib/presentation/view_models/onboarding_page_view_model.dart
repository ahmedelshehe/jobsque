import 'package:highlight_text/highlight_text.dart';

class OnBoardingViewModel{
  final String image;
  final String primaryText;
  final Map<String, HighlightedWord> words;
  final String secondaryText;

  OnBoardingViewModel(
      {required this.image, required this.primaryText, required this.words, required this.secondaryText});
}