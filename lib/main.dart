import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:Feather/pages/home_page.dart';
import 'package:Feather/pages/location_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feather',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LocationPage(),
    );
  }
}
