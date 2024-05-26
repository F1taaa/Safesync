import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safesync/pages/account_page.dart';
import 'package:safesync/pages/dashboarditem_pages/agencies_page.dart';
import 'package:safesync/pages/dashboarditem_pages/information_page.dart';
import 'package:safesync/pages/dashboarditem_pages/quickcall_page.dart';
import 'package:safesync/pages/dashboarditem_pages/reports_page.dart';
import 'package:safesync/pages/splashscreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safesync',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen(),
      routes: {
        '/account': (context) => const AccountDashboard(),
        '/agencies': (context) => AgenciesPage(),
        '/quickcall': (context) => const QuickCallPage(),
        '/information': (context) => InformationPage(),
        '/reports': (context) => ReportsPage(),
      },
    );
  }
}
