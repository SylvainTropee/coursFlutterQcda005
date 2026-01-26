import 'package:flutter/material.dart';

void main() {
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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Cliquez là !"),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.amber),
            ),
          ),
          OutlinedButton(onPressed: null, child: Text("Cliquez pas là !")),
          OutlinedButton.icon(
            onPressed: () {},
            label: Text("Bouton avec icon"),
            icon: Icon(Icons.ac_unit_rounded),
            iconAlignment: IconAlignment.end,
          ),
          Image.network("https://miro.medium.com/v2/resize:fit:640/format:webp/1*cWklGlA01JspimzBenSUKA.jpeg"),
          Image.asset("yoda.webp"),
          Image.asset("assets/yoda2.jpg")
        ],
      ),
    );
  }
}
