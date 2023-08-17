import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utils/dialog_box.dart';
import 'package:to_do_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    //if it is first time ever opening the app than
    if(_myBox.get("ToDoList")==null){
      db.createInitialData();
    }
    //if already open app
    else{
      db.load();
    }
  }
  //reference the box
  final _myBox=Hive.box("My box");
  //text controller
  final _controller = TextEditingController();

  //create instance toDoDataBase
  ToDoDataBase db=ToDoDataBase();



  //checkbox tap
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoTask[index][1] = !db.toDoTask[index][1];
    });
    db.upadateDatabase();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoTask.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancell: () => Navigator.pop(context),
          );
        });
    db.upadateDatabase();
  }
  void deleteTask(int index){
    setState(() {
      db.toDoTask.removeAt(index);
    });
    db.upadateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoTask.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: db.toDoTask[index][0],
            taskCompleted: db.toDoTask[index][1],
            onChange: (value) => checkBoxChange(value, index),
            deleteFunction: (context)=>deleteTask(index),
          );
        },
      ),
    );
  }
}
