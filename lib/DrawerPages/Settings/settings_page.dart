import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcabs/Components/custom_button.dart';
import 'package:qcabs/DrawerPages/Settings/language_cubit.dart';
import 'package:qcabs/DrawerPages/Settings/theme_cubit.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'package:qcabs/Locale/locale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  LanguageCubit _languageCubit;
  ThemeCubit _themeCubit;
  int _themeValue;
  int _languageValue;

  @override
  void initState() {
    super.initState();
    _themeValue = 0;
    _languageValue = 0;
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
    _themeCubit = BlocProvider.of<ThemeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final List<Strings> themes = [Strings.DARK_MODE, Strings.LIGHT_MODE];
    final List<Strings> languages = [
      Strings.ENGLISH,
      Strings.ARABIC,
      Strings.FRENCH,
      Strings.PORTUGUESE,
      Strings.INDONESIAN,
      Strings.SPANISH,
    ];
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                getString(Strings.SETTINGS),
                style: theme.textTheme.headline4,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                context.getString(Strings.CHOOSE_THEME),
                style:
                    theme.textTheme.bodyText2.copyWith(color: theme.hintColor),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: themes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => RadioListTile(
                activeColor: theme.primaryColor,
                value: index,
                groupValue: _themeValue,
                onChanged: (value) {
                  setState(() {
                    _themeValue = value;
                  });
                },
                title: Text(getString(themes[index])),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                context.getString(Strings.CHOOSE_LANG),
                style:
                    theme.textTheme.bodyText2.copyWith(color: theme.hintColor),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: languages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => RadioListTile(
                activeColor: theme.primaryColor,
                value: index,
                groupValue: _languageValue,
                onChanged: (value) {
                  setState(() {
                    _languageValue = value;
                  });
                },
                title: Text(getString(languages[index])),
              ),
            ),
            Spacer(),
            CustomButton(
              text: getString(Strings.SUBMIT),
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();

                if (themes[_themeValue] == Strings.LIGHT_MODE) {
                  prefs.setBool('theme', false);
                  _themeCubit.selectLightTheme();
                } else if (themes[_themeValue] == Strings.DARK_MODE) {
                  prefs.setBool('theme', true);
                  _themeCubit.selectDarkTheme();
                }
                if (languages[_languageValue] == Strings.ENGLISH) {
                  prefs.setString('locale', 'en');
                  _languageCubit.selectEngLanguage();
                } else if (languages[_languageValue] == Strings.ARABIC) {
                  prefs.setString('locale', 'ar');
                  _languageCubit.selectArabicLanguage();
                } else if (languages[_languageValue] == Strings.PORTUGUESE) {
                  prefs.setString('locale', 'pt');
                  _languageCubit.selectPortugueseLanguage();
                } else if (languages[_languageValue] == Strings.FRENCH) {
                  prefs.setString('locale', 'fr');
                  _languageCubit.selectFrenchLanguage();
                } else if (languages[_languageValue] == Strings.SPANISH) {
                  prefs.setString('locale', 'es');
                  _languageCubit.selectSpanishLanguage();
                } else if (languages[_languageValue] == Strings.INDONESIAN) {
                  prefs.setString('locale', 'in');
                  _languageCubit.selectIndonesianLanguage();
                }
              },
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
