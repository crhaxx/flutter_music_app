import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/my_drawer.dart';
import 'package:flutter_music_app/models/playlist_provider.dart';
import 'package:flutter_music_app/models/song.dart';
import 'package:flutter_music_app/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Note: get the playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    //Note: get the playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  //Note: go to a song
  void goToSong(int songIndex) {
    //Note: update current song index
    playlistProvider.currentSongIndex = songIndex;

    //Note: navigate to song page
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(),
        ));
  }

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
          "PLAYLIST",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //Note: get the playlist
          final List<Song> playlist = value.playlist;

          //Note: Return list view UI
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              //Note: get invidiual song
              final Song song = playlist[index];

              //Note: return list title UI
              return ListTile(
                title: Text(
                  song.songName,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                subtitle: Text(
                  song.artistName,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
