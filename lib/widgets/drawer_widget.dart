import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: SizedBox(
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    accountName: Text(
                      "Dinesh Singh",
                      style: TextStyle(color: Colors.white),
                    ),
                    accountEmail: Text(
                      "pokheridinesh@gmail.com",
                      style: TextStyle(color: Colors.white),
                    ),

                    margin: EdgeInsets.zero,
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/hey.png'),
                      radius: 333.3,
                    ),
                    // decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
              ),

              ListTile(
                leading: Icon(CupertinoIcons.home, color: Colors.white),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                  textScaler: TextScaler.linear(1.4),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                  textScaler: TextScaler.linear(1.4),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.mail, color: Colors.white),
                title: Text(
                  "Mail me",
                  style: TextStyle(color: Colors.white),
                  textScaler: TextScaler.linear(1.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
