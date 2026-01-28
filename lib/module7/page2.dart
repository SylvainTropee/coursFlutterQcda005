import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {

    //récupération des paramètres
    //int number = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(body: Center(child: Column(
      children: [
        Text("Page 2"),
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Back !"))
      ],
    )));
  }
}
