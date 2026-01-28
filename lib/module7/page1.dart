import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Page 1"),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, "/page-2", arguments: 123);
            }, child: Text("GO To page 2")),
          ],
        ),
      ),
    );
  }
}
