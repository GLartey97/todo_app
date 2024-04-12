import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  DialogBox(this.controller, this.onSave, this.onCancel, {super.key});
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff8780dd),
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: controller,
                  cursorColor: Colors.white,
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: false,
                  style: const TextStyle(color: Color(0xff8780dd)),
                  decoration: InputDecoration(
                    hintText: "Add a new task",
                    hintStyle: TextStyle(
                        color: const Color(0xff8780dd).withOpacity(0.5),
                        fontFamily: 'Poppins'),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save button
                MyButton("Save", onSave),

                const SizedBox(width: 10),

                //Cancel button
                MyButton("Cancel", onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}