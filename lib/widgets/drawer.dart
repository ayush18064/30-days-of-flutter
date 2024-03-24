import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://i.pinimg.com/736x/07/33/ba/0733ba760b29378474dea0fdbcb97107.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero, // Remove padding to remove the divider line
          shrinkWrap: true, // Use shrinkWrap to avoid unnecessary space
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                ),
                margin: EdgeInsets.zero,
                accountName: const Text("ayush lodha"),
                accountEmail: const Text("ayushhlodha@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaler: TextScaler.linear(1.2),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaler: TextScaler.linear(1.2),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail_solid,
                color: Colors.white,
              ),
              title: Text(
                "E-mail",
                textScaler: TextScaler.linear(1.2),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
