import 'package:flutter/material.dart';
import 'package:http_request_flutter/pages/edit/movie_list.dart';
import 'package:http_request_flutter/layout/color_pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API',
      theme: ThemeData(
        primarySwatch: ColorPalette.purpleColor,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieList();
  }
}
