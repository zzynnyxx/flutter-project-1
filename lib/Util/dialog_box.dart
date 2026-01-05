import 'package:flutter/material.dart';
import 'package:flutter_1/Util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  const DialogBox({super.key,  this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(206, 147, 216, 1),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            // buttons => save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                //save button
                MyButton(text: "Save", onPressed: () {}),

                const SizedBox(width: 12),
                // cancel button
                MyButton(text: "Cancel", onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
