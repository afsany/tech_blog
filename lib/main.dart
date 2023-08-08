import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/register_intro.dart';
import 'package:tech_blog/view/splash_screen.dart';
import 'package:tech_blog/view/main_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // fa
      ],
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2),
         
          ),
          filled: true,
          fillColor: Colors.white
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return textTheme.headline1;
              }
              return textTheme.subtitle1;
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.seeMore;
              }
              return SolidColors.primaryColor;
            }),
          ),
        ),
        fontFamily: 'dana',
        brightness: Brightness.light,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: SolidColors.posterTitle,
          ),
          subtitle1: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubTitle,
          ),
          bodyText1: TextStyle(
            fontFamily: 'dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: SolidColors.seeMore,
          ),
          headline4: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 70, 70, 70),
          ),
         headline5: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: SolidColors.hintText,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
