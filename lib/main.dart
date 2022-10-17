import 'package:flutter/material.dart';
import 'package:proyecto_elda/screen/feed_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Best Friend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FeedScreen(),
    );
  }
}

