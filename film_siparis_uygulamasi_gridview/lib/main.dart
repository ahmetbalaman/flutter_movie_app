import 'package:film_siparis_uygulamasi_gridview/screens/movies.dart';
import 'package:film_siparis_uygulamasi_gridview/screens/movies_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmler',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: const MoviePage(),
    );
  }
}