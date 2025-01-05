import 'package:flutter/material.dart';
import 'package:flutter_music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    //Note: song 1
    Song(
      songName: "Outside",
      artistName: "Calvin Harris",
      albumArtImagePath: "assets/images/DarkGraveLogo.png",
      audioPath: "assets/audio/outside.mp3",
    ),

    //Note: song 1
    Song(
      songName: "Outside",
      artistName: "Calvin Harris",
      albumArtImagePath: "assets/images/DarkGraveLogo.png",
      audioPath: "assets/audio/outside.mp3",
    ),

    //Note: song 1
    Song(
      songName: "Outside",
      artistName: "Calvin Harris",
      albumArtImagePath: "assets/images/DarkGraveLogo.png",
      audioPath: "assets/audio/outside.mp3",
    ),
  ];

  //Note: get current playing song index
  int? _currentSongIndex;

  /* GETTERS */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  /* SETTERS */
}
