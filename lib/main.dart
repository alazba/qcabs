import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qcabs/Auth/login_navigator.dart';
import 'package:qcabs/DrawerPages/Settings/language_cubit.dart';
import 'package:qcabs/DrawerPages/Settings/theme_cubit.dart';
import 'package:qcabs/Routes/page_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Locale/locale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  String locale = prefs.getString('locale');
  bool isDark = prefs.getBool('theme');
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LanguageCubit(locale)),
    BlocProvider(create: (context) => ThemeCubit(isDark ?? true)),
  ], child: QCabs()));
}

class QCabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, theme) {
            return MaterialApp(
              localizationsDelegates: [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'),
                Locale('ar'),
                Locale('fr'),
                Locale('pt'),
                Locale('es'),
                Locale('id'),
              ],
              locale: locale,
              theme: theme,
              home: LoginNavigator(),
              routes: PageRoutes().routes(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
