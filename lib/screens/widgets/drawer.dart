import 'package:flutter/material.dart';
import 'package:talabat/constant/constants.dart';
import 'package:talabat/inner_screens/profile.dart';
import 'package:talabat/inner_screens/upload_task.dart';
import 'package:talabat/screens/all_workers.dart';

class DrawerW extends StatefulWidget {
  @override
  State<DrawerW> createState() => _DrawerWState();
}

class _DrawerWState extends State<DrawerW> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.cyan),
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Image.network(
                      'https://cdn.dribbble.com/users/1787323/screenshots/11310814/media/78d925f388bdfd914f5c84a30261e239.png?compress=1&resize=400x300'),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Text(
                    "Mohamed Tharwat",
                    style: TextStyle(
                      color: Constant.darkblue,
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          _listTitle(lable: "All Tasks", fct: () {}, icon: Icons.task),
          _listTitle(
              lable: "My account",
              fct: () {
                _navigatorProfile(context);
              },
              icon: Icons.settings_outlined),
          _listTitle(
              lable: "Registered workers",
              fct: () {
                _navigatorToAllWorkers(context);
              },
              icon: Icons.workspaces_outline),
          _listTitle(
              lable: 'Add a task',
              fct: () {
                _addTask(context);
              },
              icon: Icons.add_task),
          Divider(
            thickness: 1,
          ),
          _listTitle(
              lable: 'Logout',
              fct: () {
                _logout(context);
              },
              icon: Icons.logout),
        ],
      ),
    );
  }

  void _logout(context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2017/05/29/23/02/logging-out-2355227_960_720.png",
                    height: 50,
                    width: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Constant.darkblue,
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            content: Text(
              'Do you want sign out ?',
              style: TextStyle(
                  color: Constant.darkblue,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _navigatorToAllWorkers(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllWorkers(),
      ),
    );
  }

  void _navigatorProfile(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );
  }

  void _addTask(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadTask(),
      ),
    );
  }

  Widget _listTitle(
      {required String lable, required Function fct, required IconData icon}) {
    return ListTile(
      onTap: () {
        fct();
      },
      leading: Icon(
        icon,
        color: Constant.darkblue,
      ),
      title: Text(
        lable,
        style: TextStyle(
            color: Constant.darkblue,
            fontSize: 20,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
