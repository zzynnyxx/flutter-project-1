import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(206, 147, 216, 1),
      content: Container(
        height: 150,
        child: Column(
          children: [
            // Get user input
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            // buttons => save + cancel
          ],
        ),
      ),
    );
  }
}
