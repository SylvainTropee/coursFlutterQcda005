import 'package:cours_flutter_qcda005/module7/page1.dart';
import 'package:cours_flutter_qcda005/module7/page2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/page-1",
  routes: [
    GoRoute(path: "/page-1", builder: (context, state) => PageOne()),
    GoRoute(
      path: "/page-2/:id",
      builder: (context, state) {
        var id = state.pathParameters['id'];
        int number = state.extra as int;

        print(id);
        print(number);
        return PageTwo();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
