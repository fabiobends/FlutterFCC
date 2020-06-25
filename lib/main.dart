import 'package:flutter/material.dart';
import 'package:hello_world/pages/home.dart';
import 'package:hello_world/pages/home_fb.dart';
// import 'package:hello_world/pages/home_sb.dart';
import 'package:hello_world/pages/login_page.dart';
import 'package:hello_world/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getBool("loggedIn") == true
          ? HomePageFB()
          : LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        LoginPage.route_name: (context) => LoginPage(),
        HomePage.route_name: (context) => HomePage(),
      },
    );
  }
}
