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
    return Scaffold(body: FormPage());
  }
}

class FormPage extends StatefulWidget {
  FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isChecked = false;
  bool? trueOrFalse = null;
  String? name, age, country;

  TextEditingController controllerName = TextEditingController(text: "");

  String? validateName(String? value){
    if(value == null || value.isEmpty){
      return "Le champ est obligatoire !";
    }
    if(value.length < 3){
      return "Il faut a minima 3 caractères !";
    }
    return null;
  }

  String? validateAge(String? value){
    if(value == null || value.isEmpty){
      return "Le champ est obligatoire !";
    }
    if(int.parse(value) < 18){
      return "Il faut être majeur pour continuer !";
    }
    return null;
  }

  String? validateCountry(String? value){
    if(value == null || value.isEmpty){
      return "Le champ est obligatoire !";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: controllerName,
              onChanged: (value){
                _key.currentState!.validate();
              },
              onSaved: (value) {
                name = value;
              },
              validator: validateName,
              decoration: InputDecoration(
                labelText: "Nom",
                hintText: "Veuillez saisir vitre nom !",
              ),
            ),
            TextFormField(
              onSaved: (value) {
                age = value;
              },
              validator: validateAge,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                hintText: "Veuillez saisir vitre age !",
              ),
            ),
            DropdownButtonFormField<String>(
              onSaved: (value) {
                country = value;
              },
              validator: validateCountry,
              initialValue: "",
              items: [
                DropdownMenuItem(child: Text("-Choisir un pays-"), value: ""),
                DropdownMenuItem(child: Text("France"), value: "france"),
                DropdownMenuItem(child: Text("Belgique"), value: "belgique"),
                DropdownMenuItem(child: Text("Luxembourg"), value: "lux"),
              ],
              onChanged: (value) {},
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text("La <Form> ?"),
              ],
            ),
            RadioGroup(
              groupValue: trueOrFalse,
              onChanged: (value) {
                setState(() {
                  trueOrFalse = value;
                });
              },
              child: Column(
                children: [
                  RadioListTile(value: true, title: Text("Vrai !")),
                  RadioListTile(value: false, title: Text("Faux !")),
                ],
              ),
            ),
            OutlinedButton(onPressed: () {
              if(_key.currentState!.validate()){
                _key.currentState!.save();
                print("$name, $age, $country, $trueOrFalse, $isChecked");
              }

            }, child: Text("Enregistrer")),
          ],
        ),
      ),
    );
  }
}
