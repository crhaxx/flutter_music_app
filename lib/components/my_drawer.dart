import 'package:flutter/material.dart';
import 'package:flutter_music_app/pages/home_page.dart';
import 'package:flutter_music_app/pages/playlists_page.dart';
import 'package:flutter_music_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  //Note: UI
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
                "Musicker Soundbox",
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
                  "Všechny písničky",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                onTap: () {
                  Navigator.pop(context);
                  //Note: navigate to nikolas page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
          ),

          //Note: nikolas title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text(
                "Playlisty",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              leading: Icon(
                Icons.playlist_add_check_circle,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onTap: () {
                //Note: pop drawer
                Navigator.pop(context);

                //Note: navigate to playlists page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlaylistsPage()));
              },
            ),
          ),

          //Note: settings title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text(
                "Nastavení",
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
        ],
      ),
    );
  }
}
