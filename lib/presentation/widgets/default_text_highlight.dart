import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

class DefaultTextHighlight extends StatelessWidget {
  const DefaultTextHighlight({Key? key, required this.words, required this.text, required this.style}) : super(key: key);
  final Map<String, HighlightedWord> words;
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return  TextHighlight(
      text: text, words: words,
      textStyle: style,
    );
  }
}
