import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  // F O R    T H E    T O_D O_L I S T
  //To do list
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

class HabitDatabase extends ChangeNotifier {
  //F O R   H A B I T   T R A C K E R

  //List of Habits
  List<Map<String, dynamic>> currentHabits = [];

  //reference the box
  final _myBox = Hive.box('mybox');

  //run this method if it's the first time you have ever opened the app
  void createInitialData() {
    //Save first day of app startup (for heatmap)
    // Save first day of app startup (for heatmap)
    if (_myBox.get('firstRun', defaultValue: true)) {
      // Initialize with empty habits list and mark first run as false
      _myBox.put('HABITLIST', []);
      _myBox.put('firstRun', false);
    }
    notifyListeners();
  }

  //Add new habit
  Future<void> addHabit(String habitName) async {
    // Create a new habit
    Map<String, dynamic> newHabit = {
      'name': habitName,
      'completedDays': [],
    };
    currentHabits.add(newHabit);

    // Save habit to db
    updateDatabase();

    //re-read from db
    await readHabit();
    notifyListeners();
  }

  //Read saved habits from db
  Future<void> readHabit() async {
    //fetch all habits from db
    List<dynamic> storedHabits = _myBox.get('HABITLIST', defaultValue: []);
    currentHabits = List<Map<String, dynamic>>.from(storedHabits);

    //update UI
    notifyListeners();
  }

  // Update the database when any data is changed
  void updateDatabase() {
    _myBox.put('HABITLIST', currentHabits);
    notifyListeners();
  }

  //Check habit on and off
  Future<void> updateHabitCompletion(int index, bool isCompleted) async {
    //find specific Habit
    DateTime today = DateTime.now();
    List<DateTime> habitCompletedDays =
        List<DateTime>.from(currentHabits[index]['completedDays']);

    //update completion status, if completed add the current date to completedDays if not already in the list
    //if not completed remove current date from list
    if (isCompleted) {
      if (!habitCompletedDays.contains(today)) {
        habitCompletedDays.add(today);
      }
    } else {
      habitCompletedDays.remove(today);
    }
    currentHabits[index]['completedDays'] = habitCompletedDays;

    //save the updated habits
    updateDatabase();
    notifyListeners();
  }

  //Edit habit name
  Future<void> updateHabitName(int index, String newName) async {
    //find specific habit
    currentHabits[index]['name'] = newName;

    //update habit name and save updated habit back to the db
    updateDatabase();

    //re-read from db
    await readHabit();
    notifyListeners();
  }

  //Delete habit
  Future<void> deleteHabit(int index) async {
    //perform the delete
    currentHabits.removeAt(index);

    // Save changes to db
    updateDatabase();

    //re-read from db
    readHabit();
    notifyListeners();
  }
}
