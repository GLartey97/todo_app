import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  ToDoTile(this.taskName, this.taskCompleted, this.onChanged,
      this.deleteFunction, this.updateFunction,
      {super.key});

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? updateFunction;

  Color primaryColor = const Color(0xff8780dd);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: updateFunction,
              icon: Icons.edit,
              foregroundColor: Colors.grey.shade500,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              foregroundColor: Colors.red.shade300,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          height: deviceHeight * 0.08,
          width: deviceWidth,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Checkbox(value: taskCompleted, onChanged: onChanged),
                const SizedBox(width: 5),
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
