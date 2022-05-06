import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_tel/firebase_options.dart';
import 'package:smart_tel/pages/AboutApp.dart';
import 'package:smart_tel/pages/AdminPanel.dart';
import 'package:smart_tel/pages/ContactUs.dart';
import 'package:smart_tel/pages/DeviceAddPage.dart';
import 'package:smart_tel/pages/DeviceControl1.dart';
import 'package:smart_tel/pages/DeviceControl2.dart';
import 'package:smart_tel/pages/DeviceControl3.dart';
import 'package:smart_tel/pages/DeviceDeletePage.dart';
import 'package:smart_tel/pages/ErrorConnection.dart';
import 'package:smart_tel/pages/HomePage.dart';
import 'package:smart_tel/pages/LoginPage.dart';
import 'package:smart_tel/pages/OnGoingPage.dart';
import 'package:smart_tel/pages/RegisterPage.dart';
import 'package:smart_tel/pages/SplashPage.dart';
import 'package:smart_tel/serv/NavService.dart';
import 'package:smart_tel/serv/ProviderHelper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            Page1(),
          ));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderHelper>(
      create: (context) => ProviderHelper(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (routeSettings) {
          String? pageRoute = routeSettings.name;
          dynamic arg = routeSettings.arguments;

          if (pageRoute == DeviceControl1.routeName) {
            return MaterialPageRoute(builder: (context) {
              return DeviceControl1(arg[0], arg[1]);
            });
          } else if (pageRoute == DeviceControl2.routeName) {
            return MaterialPageRoute(builder: (context) {
              return DeviceControl2(arg[0], arg[1], arg[2]);
            });
          } else if (pageRoute == DeviceControl3.routeName) {
            return MaterialPageRoute(builder: (context) {
              return DeviceControl3(arg[0], arg[1], arg[2], arg[3]);
            });
          } else {
            return MaterialPageRoute(builder: (context) {
              return HomePage();
            });
          }
        },
        routes: {
          OnGoingPage.routeName: (context) => OnGoingPage(),
          HomePage.routeName: (context) => HomePage(),
          DeviceAddPage.routeName: (context) => DeviceAddPage(),
          AdminPanel.routeName: (context) => AdminPanel(),
          DeviceDeletePage.routeName: (context) => DeviceDeletePage(),
          AboutApp.routeName: (context) => AboutApp(),
          ContactUs.routeName: (context) => ContactUs(),
          ErrorConnection.routeName: (context) => ErrorConnection(),
          LoginPage.routeName: (context) => LoginPage(),
          RegisterPage.routeName: (context) => RegisterPage(),
        },
        navigatorKey: NavServices.navServices.pageNavKey,
        home: SplashPage(),
      ),
    );
  }
}
