import 'package:flutter/material.dart';
import 'package:todo_app/themes/themes.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          AppColors.surface, //Theme.of(context).colorScheme.surface
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.dashboard_rounded,
                    color: AppColors
                        .primary, //Theme.of(context).colorScheme.primary,
                    size: 72,
                  ),
                ),
              ),

              //dashboard
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: AppColors
                      .primary, //Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: AppColors
                        .primary, //Theme.of(context).colorScheme.primary,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //ToDo Task
              ListTile(
                leading: Icon(
                  Icons.checklist_rounded,
                  color: AppColors
                      .primary, //Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "To-Do List",
                  style: TextStyle(
                    color: AppColors
                        .primary, //Theme.of(context).colorScheme.primary,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {},
              ),

              //Goal Tracker
              ListTile(
                leading: Icon(
                  Icons.track_changes_rounded,
                  color: AppColors
                      .primary, //Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "Goal Tracker",
                  style: TextStyle(
                    color: AppColors
                        .primary, //Theme.of(context).colorScheme.primary,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {},
              ),

              //Settings
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: AppColors
                      .primary, //Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: AppColors
                        .primary, //Theme.of(context).colorScheme.primary,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {},
              ),

              // CupertinoSwitch(
              //   value: Provider.of<ThemeProvider>(context).isDarkMode,
              //   onChanged: (value) =>
              //       Provider.of<ThemeProvider>(context, listen: false)
              //           .toggleTheme(),
              // ),
            ],
          ),

          //Logout
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color:
                    AppColors.primary, //Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: AppColors
                      .primary, //Theme.of(context).colorScheme.primary,
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
