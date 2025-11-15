import 'package:flutter/material.dart';
import 'package:flutter_catalog/screens/home_page.dart';
import 'package:flutter_catalog/screens/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/hunter', // mark this inital route
      theme: ThemeData(
        primaryTextTheme: GoogleFonts.lateefTextTheme(),
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routes: {
        MyRoute.homeRoute: (context) => HomePage(),
        MyRoute.loginRoute: (context) => LoginPage(),
      },

      // home: HomePage(),
    );
  }
}



/// material only for specfic 