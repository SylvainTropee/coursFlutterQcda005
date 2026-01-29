import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cat.dart';

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
    return Scaffold(body: CatView());
  }
}

class CatView extends StatefulWidget {
  const CatView({super.key});

  @override
  State<CatView> createState() => _CatViewState();
}

class _CatViewState extends State<CatView> {
  Cat? cat;

  @override
  void initState() {
    super.initState();
    getCat();
  }

  Future<void> getCat() async {
    var response = await http.get(
      Uri.parse("https://api.thecatapi.com/v1/images/search"),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      setState(() {
        cat = Cat.fromJson(json[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(cat?.id ?? "Pas de chat"),
        Image.network(
          cat?.url ?? "",
          webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
        ),
        FutureBuilder(
          future: http.get(
            Uri.parse("https://api.thecatapi.com/v1/images/search"),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data?.body != null) {
              var json = jsonDecode(snapshot.data!.body);
              return Image.network(
                Cat.fromJson(json[0]).url,
                webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
