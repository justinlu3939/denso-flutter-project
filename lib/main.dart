// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:my_app/WebViewContainer.dart';
//import 'package:my_app/login.dart';

//splash screen imports
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

//firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/firebase_options.dart';

import 'package:my_app/pages/signup.dart';

//may need to change void -> Future<void>
void main() async{
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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

  //this firebase auth code below is a beta implementation for remember me
  var auth = FirebaseAuth.instance;
  var isLogin = false;

  bool get _isLogin => isLogin;

  checkiflogin () async {
    //User? user = await auth.authStateChanges().first; //if change to statelesswidget, replace bottom line with this
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User signed out');
        setState(() {
          isLogin = false;
        });
      } else {
        print('User signed in');
        setState(() {
          isLogin = true;
        });
        //Navigator.pushNamed(context, '/landingpage'); //doesn't work
      }
    });
  }

  @override
  void initState() {
    checkiflogin();
    super.initState();
    //print('result$_isLogin');
  }
  //it ends here. if you need to remove this feature. Delete this code and change the MyApp back to Stateless

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
