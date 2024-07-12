import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/SplashScreens/splashscreen1.dart';
import 'package:todo_app/themes/theme_provider.dart';

void main(List<String> args) async {
  //initiate the hive
  await Hive.initFlutter();

  //open a box
  await Hive.openBox('mybox');

  runApp(
    //ChangeNotifierProvider(
    //create: (context) => ThemeProvider(),
    //child:
    const MyApp(),
    //),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashScreen1(),
    );
  }
}
