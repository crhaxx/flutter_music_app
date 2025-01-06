import 'package:flutter/material.dart';
import 'package:flutter_music_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //Note: logo
          DrawerHeader(
            child: Center(
              /* child: Icon(
                Icons.music_note,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ), */
              child: Text(
                "Musicker Sondbox",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          //Note: home title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0),
            child: ListTile(
              title: Text(
                "Main Playlist",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),

          //Note: settings title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text(
                "Settings",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onTap: () {
                //Note: pop drawer
                Navigator.pop(context);

                //Note: navigate to settings page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          ),

          //Note: home title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0),
            child: ListTile(
              title: Text(
                "Soon",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              leading: Icon(
                Icons.new_label,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
