import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChange,required this.deleteFunction});
  //delete task
  final Function(BuildContext)?deleteFunction;

  //task name
  final String taskName;

  //checkbox value
  final bool taskCompleted;

  //checkbox onchange value
  final Function(bool?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 24),
      child: Slidable(
        //slideable delete button
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChange,
                activeColor: Colors.black,
              ),
              //task name
              Text(
                taskName,
                //if task completed than line through and if task not completed than not linethrough in task
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
