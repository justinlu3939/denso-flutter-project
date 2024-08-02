// ignore_for_file: use_super_parameters, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart' as fs; //fs is needed because we have a settings.dart already
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/pages/ItemList.dart';
import 'package:my_app/pages/Homepage.dart';
import 'package:my_app/pages/demoPageForFilterItem.dart';
import 'package:my_app/pages/editProfile.dart';
import 'package:my_app/pages/favorites.dart';
import 'package:my_app/pages/forgotpw.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/profile.dart';
import 'package:my_app/pages/settings.dart';
import 'package:provider/provider.dart';
import 'package:my_app/WebViewContainer.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/firebase_options.dart';
import 'package:my_app/pages/signup.dart';

//may need to change void -> Future<void>
void main() async{
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  await Hive.openBox('settings');
  //debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  fs.FirebaseFirestore firebase = fs.FirebaseFirestore.instance;
  firebase.settings = fs.Settings(persistenceEnabled: true);
  runApp(MyApp()); //original run statement
}

//this is a test function. delete if dark mode doesn't work
//wrap this around the entire app, the button that uses it will have to change all widgets
class ThemeModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final Box settingsBox = Hive.box('settings');
  ThemeModel() {
    loadThemeFromHive();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    _saveTheme();
    notifyListeners();
  }

  void _saveTheme() {
    settingsBox.put('themeMode', _themeMode == ThemeMode.light ? 'light' : 'dark');
  }
  void loadThemeFromHive() {
    final themeMode = settingsBox.get('themeMode', defaultValue: 'light');
    if (themeMode == 'dark') {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}

class SplashScreen extends StatelessWidget{
  const SplashScreen ({super.key});
  // final bool signedIn = isLogin; //if i want to do persistent signin, this is the first step
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //since it was changed to a stateful widget, we won't need the key
  //MyApp({Key? key}) : super(key: key);
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
            home: SplashScreen(),
            routes: {
              '/landingpage': (context) => const LandingPage(),
              '/itemlist': (context) => const MyItemList(title: 'DENSO'),
              '/webviewcontainer': (context) => WebViewContainer(
                  keyword:
                      ModalRoute.of(context)?.settings.arguments as String),
              '/settings': (context) => const Settings(),
              '/signout': (context) => LoginPage(),
              '/signup': (context) => Signup(),
              '/forgetpw': (context) => Forgetpw(),
              '/demoPage': (context) => demoPage(),
              '/profile': (context) => Profile(),
              '/favorite': (context) => Favorites(),
              '/editprofile': (context) => Editprofile(),
            },
          );
        },
      ),
    );
  }
}
