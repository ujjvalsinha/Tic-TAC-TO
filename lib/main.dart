import 'package:flutter/material.dart';
import 'package:tictacto/Player.dart';
import 'package:splashscreen/splashscreen.dart';

main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        title: new Text(
          'TIC TAC TO',
          style: new TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        navigateAfterSeconds: new Player(),
        image: Image.asset("images/out.png"),
        backgroundColor: Colors.orangeAccent,
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}
