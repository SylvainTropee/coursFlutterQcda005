import 'package:cours_flutter_qcda005/module7/page1.dart';
import 'package:cours_flutter_qcda005/module7/page2.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "/page-1" : (context) => PageOne(),
        "/page-2" : (context) => PageTwo(),
      },
      initialRoute: "/page-1",
    );
  }
}



