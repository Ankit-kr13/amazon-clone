import 'package:amazon_clone/constant/global.dart';
import 'package:amazon_clone/router.dart';
import 'package:amazon_clone/view/authScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(primary: globalVariables.primaryColor),
      ),
      home: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text("Amazon"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Hello Amazon")),
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AuthScreen.routeName);
                    },
                    child: Text("Click me"));
              })
            ],
          )),
    );
  }
}
