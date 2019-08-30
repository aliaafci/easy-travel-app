import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'generated/i18n.dart';
import 'navigation/navigationHandler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  accentColor: Colors.black,
  brightness: Brightness.light,
);



void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
        statusBarIconBrightness: Brightness.dark, //top bar icons
        systemNavigationBarColor: Colors.transparent, //bottom bar color
        systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
      )
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(new MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Travel',
      debugShowCheckedModeBanner: false,
showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      onGenerateRoute: NavigationHandler.getRoute,
      localizationsDelegates: [S.delegate,
        GlobalMaterialLocalizations.delegate,
      ],

      supportedLocales: S.delegate.supportedLocales,
    );
  }
}


