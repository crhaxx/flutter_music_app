import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
            playlistname: "Všechny písničky",
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
            );
          },
        ),
        title: Text(
          "Všechny písničky",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: Icon(Icons.search),
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ],
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
                leading: Container(
                  height: 60,
                  width: 50,
                  child: Image.asset(
                    song.albumArtImagePath,
                    fit: BoxFit.fill,
                  ),
                ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongPage(
                              playlistname: "Všechny písničky",
                            ),
                          ));
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        currentSong.albumArtImagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongPage(
                              playlistname: "Všechny písničky",
                            ),
                          ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          child: Text(
                            currentSong.songName,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 13),
                            overflow: TextOverflow.clip,
                            //softWrap: true,
                          ),
                        ),
                        Container(
                          width: 140,
                          child: Text(
                            textAlign: TextAlign.start,
                            currentSong.artistName,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(width: 10),
                  Spacer(flex: 1),
                  IconButton(
                    onPressed: () {
                      value.playPreviousSong();
                    },
                    icon: Icon(
                      Icons.skip_previous,
                      size: 33,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      value.isPlaying ? value.pause() : value.resume();
                    },
                    icon: Icon(
                      value.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 33,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      value.playNextSong();
                    },
                    icon: Icon(
                      Icons.skip_next,
                      size: 33,
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

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTermNames = [];
  List<String> searchTermAuthors = [];
  List<String> searchTermImages = [];
  List<int> seachIndexes = [];

  bool foundSongs = false;

  void playSong(int index, context) {
    Provider.of<PlaylistProvider>(context, listen: false).currentSongIndex =
        index;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(
            playlistname: "Všechny písničky",
          ),
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    if (!foundSongs) {
      for (int i = 0; i < PlaylistProvider().playlist.length; i++) {
        final Song song = PlaylistProvider().playlist[i];
        searchTermNames.add(song.songName);
        searchTermAuthors.add(song.artistName);
        searchTermImages.add(song.albumArtImagePath);
      }
      foundSongs = true;
    }
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      color: Theme.of(context).colorScheme.inversePrimary,
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var song in searchTermNames) {
      if (song.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(song);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return ListTile(
          title: Text(result),
          subtitle: Text(searchTermAuthors[index].toString()),
          tileColor: Theme.of(context).colorScheme.background,
          leading: Image.asset(searchTermImages[index].toString()),
          onTap: () {
            playSong(
                searchTermNames.indexWhere((item) => item.contains(result)),
                context);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var song in searchTermNames) {
      if (song.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(song);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return ListTile(
          textColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(result),
          subtitle: Text(searchTermAuthors[index].toString()),
          tileColor: Theme.of(context).colorScheme.background,
          leading: Image.asset(searchTermImages[
                  searchTermNames.indexWhere((item) => item.contains(result))]
              .toString()),
          onTap: () {
            playSong(
                searchTermNames.indexWhere((item) => item.contains(result)),
                context);
          },
        );
      },
    );
  }
}
