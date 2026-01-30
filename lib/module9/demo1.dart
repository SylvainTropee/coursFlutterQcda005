import 'package:cours_flutter_qcda005/module9/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (_) => CounterProvider(0),
    //   child: const MyApp(),
    // ),
    const MyApp(),
  );
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
      initialRoute: '/',
      routes: {
        '/': (context) => ChangeNotifierProvider(
          create: (_) => CounterProvider(0),
          child: PageOne(),
        ),
        '/page-2': (context) => ChangeNotifierProvider(
          create: (_) => CounterProvider(0),
          child: PageTwo(),
        ),
      },
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final _counterProvider = context.watch<CounterProvider>();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Compteur : ${_counterProvider.counter}"),
            OutlinedButton(
              onPressed: () {
                _counterProvider.increment();
              },
              child: Text("+"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page-2");
              },
              child: Text("GO !"),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    //final _counterProvider = Provider.of<CounterProvider>(context);
    final _counterProvider = context.watch<CounterProvider>();
    ;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Compteur : ${_counterProvider.counter}"),
            OutlinedButton(
              onPressed: () {
                _counterProvider.increment();
              },
              child: Text("+"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back !"),
            ),
          ],
        ),
      ),
    );
  }
}
