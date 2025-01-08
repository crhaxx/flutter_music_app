import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/my_drawer.dart';
import 'package:flutter_music_app/models/playlist_provider.dart';
import 'package:flutter_music_app/models/song.dart';
import 'package:flutter_music_app/pages/song_page.dart';
import 'package:provider/provider.dart';

class PlaylistPage extends StatefulWidget {
  final String textFirstName;

  const PlaylistPage({Key? key, required this.textFirstName}) : super(key: key);

  @override
  State<PlaylistPage> createState() => _PlaylistPage();
}

class _PlaylistPage extends State<PlaylistPage> {
  //Note: get the playlist provider
  late final dynamic playlistProvider;

  //Note: convert duration into minutes and seconds
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }

  bool showbaner = false;

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
          builder: (context) => SongPage(
            playlistname: widget.textFirstName.toString(),
          ),
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
          widget.textFirstName.toString(),
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

      bottomNavigationBar: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //Note: get playlist
          final playlist = value.playlist;

          //Note: get current song
          final currentSong = playlist[value.currentSongIndex ?? 0];

          showbaner = value.currentSongIndex == null ? false : true;
          return Visibility(
            visible: showbaner,
            child: BottomAppBar(
              color: Theme.of(context).colorScheme.tertiary,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      currentSong.albumArtImagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentSong.songName,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 13),
                      ),
                      Text(
                        currentSong.artistName,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 9),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      value.playPreviousSong();
                    },
                    icon: Icon(
                      Icons.skip_previous,
                      size: 30,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      value.isPlaying ? value.pause() : value.resume();
                    },
                    icon: Icon(
                      value.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 30,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      value.playNextSong();
                    },
                    icon: Icon(
                      Icons.skip_next,
                      size: 30,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToSong(playlistProvider.currentSongIndex);
        },
        child: Icon(Icons.music_note),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, */
      //persistentFooterAlignment: AlignmentDirectional.centerStart,
    );
  }
}
