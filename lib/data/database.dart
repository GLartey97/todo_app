import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //reference the box
  final _myBox = Hive.box('mybox');

  //run this method if it's the first time you have ever opened the app
  void createInitialData() {
    toDoList = [
      ['Study the Bible', false],
      ['Buy Waakye', false]
    ];
  }

  //load our database if it has already been opened before
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database when any data is added
  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
