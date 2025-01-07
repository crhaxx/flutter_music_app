import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/my_drawer.dart';
import 'package:flutter_music_app/database%20model/playlist.dart';
import 'package:flutter_music_app/databases/playlist_database.dart';

class TerezkasPage extends StatefulWidget {
  const TerezkasPage({super.key});

  @override
  State<TerezkasPage> createState() => _TerezkasPageState();
}

class _TerezkasPageState extends State<TerezkasPage> {
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
                        name: playlistController.text, user: 'terezka');

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
          "Terezka písničky",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () => createPlaylist(context),
          child: Icon(Icons.add)),
      drawer: MyDrawer(),
      body: StreamBuilder(
          stream: playlistDatabase.streamTerezka,
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

                  //Note: UI
                  return ListTile(
                    title: Text(
                      playlist.name,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 25),
                    ),
                    trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            //Note: update button
                            IconButton(
                                onPressed: () => updatePlaylistName(playlist),
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
          }),
    );
  }
}
