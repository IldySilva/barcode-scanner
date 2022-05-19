import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prouserchallenge/View/Screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProCode Reader',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.indigo,
        appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}
