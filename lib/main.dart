import 'dart:async';
import 'package:flutter/material.dart';
import 'package:followers_reports_analyzer/home/home_page_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Followers reports analyzer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}
