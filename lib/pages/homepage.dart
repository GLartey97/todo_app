import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/themes/themes.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/drawer.dart';
import 'package:todo_app/utils/todo_tiles.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //If this is the first time ever opening the app, then create initial data
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      //If the app has already been opened before, then load data
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  //DateTime date = DateTime.now();
  String formattedDate = DateFormat('dd MMMM').format(DateTime.now());

  //when checkbox is pressed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //Save new Task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //Delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  void editTask(int index) {
    _controller.text = db.toDoList[index][0];
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            _controller,
            () {
              setState(() {
                db.toDoList[index][0] = _controller.text;
                _controller.clear();
              });
              Navigator.pop(context);
              db.updateDatabase();
            },
            () {
              _controller.clear();
              Navigator.pop(context);
            },
            buttonLabel: "Update",
          );
        });
  }

  //Create new Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          _controller,
          saveNewTask,
          () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: IconThemeData(
            color: AppColors.primary), //Theme.of(context).colorScheme.primary
        title: Text(
          formattedDate,
          style: TextStyle(
              color: AppColors.primary, //Theme.of(context).colorScheme.primary
              fontFamily: 'Montserrat'),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(
              Icons.timer,
              color: AppColors.primary, //Theme.of(context).colorScheme.primary
            ),
          ),
        ],
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          //Background
          Container(
            height: deviceHeight,
            width: deviceWidth,
            color: AppColors.surface, //Theme.of(context).colorScheme.surface,
          ),

          //Top Layer Items
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Today",
                    style: TextStyle(
                        color: AppColors
                            .primary, //Theme.of(context).colorScheme.primary
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'PT_Sans'),
                  ),
                ),
                MaterialButton(
                  height: deviceHeight * 0.06,
                  minWidth: deviceWidth * 0.3,
                  color:
                      AppColors.primary, //Theme.of(context).colorScheme.primary
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: createNewTask,
                  child: const Text(
                    'Add New',
                    style: TextStyle(
                        color: AppColors
                            .surface), //Theme.of(context).colorScheme.surface),
                  ),
                ),
              ],
            ),
          ),

          //Task text
          Padding(
            padding: const EdgeInsets.only(top: 58, left: 30),
            child: Text(
              "${db.toDoList.length} Tasks",
              style: TextStyle(
                color:
                    AppColors.primary, //Theme.of(context).colorScheme.primary
                fontSize: 11,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),

          //White layer
          Padding(
            padding: EdgeInsets.only(top: deviceHeight * 0.15),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(50)),
              child: Container(
                height: deviceHeight * 0.80,
                width: deviceWidth,
                decoration: BoxDecoration(
                    color: AppColors
                        .primary), //Theme.of(context).colorScheme.primary
              ),
            ),
          ),

          //Contents in white layer
          //To do list
          Padding(
            padding: EdgeInsets.fromLTRB(30, deviceHeight * 0.22, 30, 0),
            child: SizedBox(
              height: deviceHeight * 0.58,
              child: ListView.builder(
                itemCount: db.toDoList.length,
                itemBuilder: (context, index) {
                  return ToDoTile(
                    db.toDoList[index][0],
                    db.toDoList[index][1],
                    (value) => checkBoxChanged(value, index),
                    (context) => deleteTask(index),
                    (context) => editTask(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
