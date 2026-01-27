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
    return Scaffold(body: ArticleList());
  }
}

class ArticleList extends StatefulWidget {

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  double total = 0.0;

  void updateTotal(double price){
    setState(() {
      total += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Article("Clavier", 12.50, updateTotal),
        Article("Souris", 2.50, updateTotal),
        Article("Ram", 122.22, updateTotal),
        Article("Ecran", 99.99, updateTotal),
        Text("Total = $total €")
      ],
    );
  }
}

class Article extends StatefulWidget {
  final String name;
  final double price;
  final Function(double) updateTotal;

  const Article(this.name, this.price, this.updateTotal);

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  int quantity = 0;

  void increment() {
    setState(() {
      quantity++;
      widget.updateTotal(widget.price);
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 0) {
        quantity--;
        widget.updateTotal(-widget.price);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.name),
        Text("${widget.price} €"),
        ElevatedButton(onPressed: increment, child: Icon(Icons.add)),
        Text("$quantity"),
        ElevatedButton(onPressed: decrement, child: Icon(Icons.remove)),
        Text("Total ${widget.price * quantity} €"),
      ],
    );
  }
}
