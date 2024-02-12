import 'package:flutter/material.dart';
import 'package:flutter_project/views/about.dart';
import 'package:flutter_project/views/profile.dart';

import 'views/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RESTful API:MINI PROJECT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const DashboardPage(title: "Dashboard Menu"),
        '/about':(context) => const AboutPage(title: "About Page"),
        '/profile':(context) => const ProfilePage(title: "Profile Page"),
      },
    );
  }
}

