import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_with_getstorage/screens/home_screen.dart';
import 'package:todo_with_getstorage/screens/save_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepOrange)),
      home: HomeScreen(),
    );
  }
}
