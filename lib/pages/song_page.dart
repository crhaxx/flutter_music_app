import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/neu_box.dart';
import 'package:flutter_music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  final String playlistname;

  const SongPage({Key? key, required this.playlistname}) : super(key: key);

  //Note: convert duration into minutes and seconds
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      //Note: get playlist
      final playlist = value.playlist;

      //Note: get current song
      final currentSong = playlist[value.currentSongIndex ?? 0];

      //Note: return scaffold UI
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Note: app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Note: back button
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          //getCurrent(value);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )),

                    //Note: title
                    Text(
                      playlistname,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),

                    //Note: menu button
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )),
                  ],
                ),

                const SizedBox(height: 25),

                //Note: album artwork
                NeuBox(
                  child: Column(
                    children: [
                      //Note: image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(currentSong.albumArtImagePath),
                      ),

                      //Note: song, artist name and heart icon
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Note: song and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary),
                                ),
                                Text(
                                  currentSong.artistName,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary),
                                )
                              ],
                            ),

                            //Note: heart icon
                            /* const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ), */
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                //Note: song duration progress
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Note: start time
                          Text(
                            formatTime(value.currentDuration),
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),

                          //Note: shuffle icon
                          GestureDetector(
                            onTap: () => Provider.of<PlaylistProvider>(context,
                                            listen: false)
                                        .playRandom ==
                                    false
                                ? Provider.of<PlaylistProvider>(context,
                                        listen: false)
                                    .playRandom = true
                                : Provider.of<PlaylistProvider>(context,
                                        listen: false)
                                    .playRandom = false,
                            child: Icon(
                              Icons.shuffle,
                              color: Provider.of<PlaylistProvider>(context)
                                          .playRandom ==
                                      false
                                  ? Theme.of(context).colorScheme.scrim
                                  : Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                            ),
                          ),

                          //Note: repeat icon
                          GestureDetector(
                            onTap: () => Provider.of<PlaylistProvider>(context,
                                            listen: false)
                                        .repeatSong ==
                                    false
                                ? Provider.of<PlaylistProvider>(context,
                                        listen: false)
                                    .repeatSong = true
                                : Provider.of<PlaylistProvider>(context,
                                        listen: false)
                                    .repeatSong = false,
                            child: Icon(
                              Icons.repeat,
                              color: Provider.of<PlaylistProvider>(context)
                                          .repeatSong ==
                                      false
                                  ? Theme.of(context).colorScheme.scrim
                                  : Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                            ),
                          ),

                          //Note: end time
                          Text(
                            formatTime(value.totalDuration),
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                        ],
                      ),
                    ),

                    //Note: song progress bar
                    Slider(
                      min: 0,
                      max: value.totalDuration.inSeconds.toDouble(),
                      value: value.currentDuration.inSeconds.toDouble(),
                      activeColor: Colors.green,
                      thumbColor: Colors.white,
                      inactiveColor: Colors.grey.shade500,
                      onChanged: (double double) {
                        //Info: during when user drags the slider
                      },
                      onChangeEnd: (double double) {
                        //Info: sliding ends, go to that position in song duration
                        value.seek(Duration(seconds: double.toInt()));
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                //Note: playback controls
                Row(
                  children: [
                    //Note: skip previous button
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playPreviousSong,
                        child: NeuBox(
                          child: Icon(
                            Icons.skip_previous,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    //Note: play/pause button
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: value.pauseOrResume,
                        child: NeuBox(
                          child: Icon(
                            value.isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    //Note: skip forward button
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playNextSong,
                        child: NeuBox(
                          child: Icon(
                            Icons.skip_next,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
