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
    return ShopppingList();
    // return Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text("Colonne 1"),
    //       Expanded(child: Text("Colonne 2")),
    //       Expanded(child: Text("Colonne 3")),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 8.0),
    //             child: Text("Row 1"),
    //           ),
    //           Text("Row 2")
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}

class BigPage extends StatelessWidget {
  const BigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello !")),
      body: SingleChildScrollView(
        child: Column(children: [
          Text('Scrollable', style: TextStyle( color: Colors.purple, fontSize: 40)),
          SizedBox(height: 2500),
          Text("Fin")
        ]),
      ),
    );
  }
}

class ShopppingList extends StatelessWidget {
  ShopppingList({super.key});

  final List<String> list = [
    "PQ",
    "Crêpes",
    "Fromage râpé",
    "Chocolat",
    "Baileys"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return Text(list[index]);
        },
      ),
    );
  }
}


