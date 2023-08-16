import 'package:flutter/material.dart';
import 'package:to_do_app/page/home_page.dart';

void main(){
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
