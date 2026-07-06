import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_with_getstorage/screens/home_screen.dart';
import 'package:todo_with_getstorage/screens/save_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomeScreen(),
    );
  }
}
