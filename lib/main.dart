import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/SplashScreens/splashscreen1.dart';

void main(List<String> args) async {
  //initiate the hive
  await Hive.initFlutter();

  //open a box
  await Hive.openBox('mybox');

  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => ThemeProvider()),
    //     ChangeNotifierProvider(create: (_) => HabitDatabase()),
    //   ],
    //   child:
    ChangeNotifierProvider(
      create: (context) => HabitDatabase(),
      child: const MyApp(),
    ),

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
