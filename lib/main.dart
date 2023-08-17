import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/page/home_page.dart';

Future<void> main() async {
  //init hive
  await Hive.initFlutter;
  //open a box
  var box=await Hive.openBox("my box");
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),


    );
  }
}
