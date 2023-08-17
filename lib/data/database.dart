import 'package:hive/hive.dart';

class ToDoDataBase {
  //reference the box
  final _myBox = Hive.box("My box");
  List toDoTask = [];


  //apply this method if this is 1st time open this app
  void createInitialData() {
    toDoTask = [
      ["To Do List 1", false],
      ["To Do List 2", false]
    ];
  }

  //load data form database
  void load(){
    toDoTask=_myBox.get('ToDoList');
  }

  //update database
  void upadateDatabase(){
    _myBox.put("ToDoList", toDoTask);
  }

}