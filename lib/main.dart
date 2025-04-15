import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mytoko',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle
        (
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
        )
      )
    );
  }
}


