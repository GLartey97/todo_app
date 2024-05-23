import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  DialogBox(this.controller, this.onSave, this.onCancel,
      {this.buttonLabel = "Save", super.key});
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: controller,
                  cursorColor: Theme.of(context).colorScheme.primary,
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: false,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.surface),
                  decoration: InputDecoration(
                    hintText: "Add a new task",
                    hintStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.5),
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
                //Save/Update button
                MyButton(buttonLabel, onSave),

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
