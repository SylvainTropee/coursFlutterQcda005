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
    return Scaffold(body: PasswordWidget(label: "Password"));
  }
}

class PasswordWidget extends StatefulWidget {
  String label;

  PasswordWidget({required this.label, super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool isVisible = true;

  _toggleVisibility(bool value) {
    setState(() {
      isVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            obscureText: !isVisible,
            decoration: InputDecoration(labelText: widget.label),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isVisible ? Icons.lock_open : Icons.lock),
              Switch(value: isVisible, onChanged: _toggleVisibility),
            ],
          ),
        ],
      ),
    );
  }
}
