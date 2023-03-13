import 'package:flutter/material.dart';
import 'package:jobsque/constants/my_cache_keys.dart';

import '../../../data/local/my_cache.dart';
import '../../views/profile_screen_views/language_radio_list_tile.dart';
import '../../widgets/default_text.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}
class _LanguageScreenState extends State<LanguageScreen> {
  late String language;
  @override
  void initState() {
    language=MyCache.getString(key: MyCacheKeys.language);
    super.initState();
  }
  @override
  void dispose() {
    MyCache.putString(key: MyCacheKeys.language, value: language);
    super.dispose();
  }
  chooseLanguage(String? value){
    setState(() {
      language=value!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(
          text: 'Language',
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
        children:  [
          LanguageRadioListTile(groupValue: language,value: 'english',flag: 'GB',onChanged: (value) => chooseLanguage(value),),
          LanguageRadioListTile(groupValue: language,value: 'indonesia',flag: 'ID',onChanged: (value) => chooseLanguage(value),),
          LanguageRadioListTile(groupValue: language,value: 'arabic',flag: 'SA',onChanged: (value) => chooseLanguage(value),),
          LanguageRadioListTile(groupValue: language,value: 'chinese',flag: 'CN',onChanged: (value) => chooseLanguage(value),),
          LanguageRadioListTile(groupValue: language,value: 'dutch',flag: 'NL',onChanged: (value) => chooseLanguage(value),),
          LanguageRadioListTile(groupValue: language,value: 'french',flag: 'FR',onChanged: (value) => chooseLanguage(value),),
          LanguageRadioListTile(groupValue: language,value: 'german',flag: 'DE',onChanged: (value) => chooseLanguage(value),),
          LanguageRadioListTile(groupValue: language,value: 'japanese',flag: 'JP',onChanged: (value) => chooseLanguage(value),),
          LanguageRadioListTile(groupValue: language,value: 'korean',flag: 'KR',onChanged: (value) => chooseLanguage(value),),
          LanguageRadioListTile(groupValue: language,value: 'portuguese',flag: 'PT',onChanged: (value) => chooseLanguage(value),),
        ],
      ),
    );
  }
}


