import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/my_drawer.dart';
import 'package:flutter_music_app/database%20model/playlist.dart';
import 'package:flutter_music_app/databases/playlist_database.dart';
import 'package:flutter_music_app/models/playlist_provider.dart';
import 'package:flutter_music_app/pages/playlist_page.dart';
import 'package:provider/provider.dart';

class PlaylistsPage extends StatefulWidget {
  const PlaylistsPage({super.key});

  @override
  State<PlaylistsPage> createState() => _PlaylistsPage();
}

class _PlaylistsPage extends State<PlaylistsPage> {
  //Note: get the playlist provider
  late final dynamic playlistProvider;

  //Note: playlist DB
  final playlistDatabase = PlaylistDatabase();

  //Note: text controller
  final playlistController = TextEditingController();

  //Info: user wants to create a new playlist
  void createPlaylist(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Vytvořit Playlist"),
              content: TextField(
                controller: playlistController,
              ),
              actions: [
                //Note: cancel button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    playlistController.clear();
                  },
                  child: Text('Zrušit'),
                ),

                //Note: create playlist
                TextButton(
                  onPressed: () {
                    final newPlaylist = Playlist(
                        name: playlistController.text, user: 'nikolas');

                    //Note: Save in DB
                    playlistDatabase.createPlaylist(newPlaylist);

                    Navigator.pop(context);
                    playlistController.clear();
                  },
                  child: Text('Vytvořit'),
                ),
              ],
            ));
  }

  //Info: user wants to update a playlist name
  void updatePlaylistName(Playlist playlist) {
    //Note: get existing playlist name
    playlistController.text = playlist.name;

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Změnit název playlistu"),
              content: TextField(
                controller: playlistController,
              ),
              actions: [
                //Note: cancel button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    playlistController.clear();
                  },
                  child: Text('Zrušit'),
                ),

                //Note: create playlist
                TextButton(
                  onPressed: () {
                    //Note: Save in DB
                    playlistDatabase.updatePlaylist(
                        playlist, playlistController.text);

                    Navigator.pop(context);
                    playlistController.clear();
                  },
                  child: Text('Uložit'),
                ),
              ],
            ));
  }

  //Info: user wants to delete a playlist
  void deletePlaylist(Playlist playlist) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Chceš smazat playlist?"),
              actions: [
                //Note: cancel button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    playlistController.clear();
                  },
                  child: Text('Zrušit'),
                ),

                //Note: create playlist
                TextButton(
                  onPressed: () {
                    //Note: Save in DB
                    playlistDatabase.deletePlaylist(playlist);

                    Navigator.pop(context);
                    playlistController.clear();
                  },
                  child: Text('Ano'),
                ),
              ],
            ));
  }

  //Note: UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary, // Change Custom Drawer Icon Color
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text(
            "Playlisty",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurpleAccent,
            onPressed: () => createPlaylist(context),
            child: Icon(Icons.add)),
        drawer: MyDrawer(),
        body: StreamBuilder(
            stream: playlistDatabase.streamPlaylists,
            builder: (context, snapshot) {
              //Info: loading
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              //Info: loaded
              final playlists = snapshot.data!;

              //Note: list of playlists
              return ListView.builder(
                  itemCount: playlists.length,
                  itemBuilder: (context, index) {
                    //Note: get each playlist
                    final playlist = playlists[index];

                    return Consumer<PlaylistProvider>(
                        builder: (context, value, child) {
                      //Note: UI
                      return ListTile(
                        onTap: () {
                          //Note: pop drawer
                          Navigator.pop(context);

                          //Note: navigate to playlists page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaylistPage(
                                        textFirstName: playlist.name,
                                      )));
                        },
                        title: Text(
                          playlist.name,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 25),
                        ),
                        trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                //Note: update button
                                IconButton(
                                    onPressed: () =>
                                        updatePlaylistName(playlist),
                                    icon: Icon(
                                      Icons.edit,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    )),
                                //Note: delete button
                                IconButton(
                                    onPressed: () => deletePlaylist(playlist),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    )),
                              ],
                            )),
                      );
                    });
                  });
            }));
  }
}
