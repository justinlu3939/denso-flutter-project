// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/ItemList.dart';
import 'package:my_app/Homepage.dart';
import 'package:my_app/login.dart';
import 'package:my_app/settings.dart';
import 'package:provider/provider.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:my_app/WebViewContainer.dart';
//import 'package:my_app/login.dart';

//splash screen imports
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp()); //original run statement
}

//this is a test function. delete if dark mode doesn't work
//wrap this around the entire app, the button that uses it will have to change all widgets
class ThemeModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}

class SplashScreen extends StatelessWidget{
  const SplashScreen ({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'Images/testimage.png',
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: Builder(
        builder: (context) {
          final themeModel = Provider.of<ThemeModel>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeModel.themeMode,
            //home: LoginPage(),
            home: const SplashScreen(),
            routes: {
              '/landingpage': (context) => const LandingPage(),
              '/itemlist': (context) => const MyItemList(title: 'DENSO'),
              '/webviewcontainer': (context) => WebViewContainer(
                  keyword:
                      ModalRoute.of(context)?.settings.arguments as String),
              '/settings': (context) => const Settings(),
              '/signout': (context) => LoginPage(),
            },
          );
        },
      ),
    );
  }
}
