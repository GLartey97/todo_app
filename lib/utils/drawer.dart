import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  Color primaryColor = const Color(0xff8780dd);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              const DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.dashboard_rounded,
                    color: Colors.white,
                    size: 72,
                  ),
                ),
              ),

              //dashboard
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //ToDo Task
              ListTile(
                leading: const Icon(
                  Icons.checklist_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  "To-Do List",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {},
              ),

              //Goal Tracker
              ListTile(
                leading: const Icon(
                  Icons.track_changes_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  "Goal Tracker",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {},
              ),

              //Settings
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: const Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),

          //Logout
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
