import 'package:flutter/material.dart';
import 'package:networking_app/localization/localization_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:networking_app/routes.dart';
// import 'package:networking_app/routes/categorias/categorias.dart';
// import 'package:networking_app/routes/sistemas/sistemas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "Flutter demo",
      // onGenerateTitle: (context) => context.localize("title"),

      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      localizationsDelegates: [
        const AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale.fromSubtags(languageCode: "en"),
        Locale.fromSubtags(languageCode: "it"),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
