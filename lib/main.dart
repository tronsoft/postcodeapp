import 'package:flutter/material.dart';
import 'package:postcodeapp/Views/test.dart';
import 'package:postcodeapp/Views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the postcodeapp.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Postcode App'),
        ),
        body: const HomePage(),
      )
    );
  }
}

