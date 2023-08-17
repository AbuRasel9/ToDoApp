import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancell;
  final controller;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancell});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.greenAccent,
      content: Container(
        height: 120,
        child: Column(
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add new Task"),
            ),
            //save and cancell button
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //save button
                MYButton(onTap: onSave, text: "Save"),
                //cancell button
                MYButton(onTap: onCancell, text: "Cancell")
              ],
            )
          ],
        ),
      ),
    );
  }
}
