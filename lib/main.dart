import 'package:flutter/material.dart';
import 'package:login_test/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login test',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const AuthScreen(),
    );
  }
}
