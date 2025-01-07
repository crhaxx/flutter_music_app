import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    //Note: song 1
    Song(
      songName: "1000 Blunts",
      artistName: '\$uicideboy\$',
      albumArtImagePath: "assets/images/1000BLUNTS.jpg",
      audioPath: "./audio/1000BLUNTS.mp3",
    ),

    //Note: song 2
    Song(
      songName: "Addicted To You",
      artistName: 'Picture This',
      albumArtImagePath: "assets/images/AddictedToYou.jpg",
      audioPath: "./audio/AddictedToYou.mp3",
    ),

    //Note: song 3
    Song(
      songName: "Ai se eu te pego",
      artistName: 'Michel Teló',
      albumArtImagePath: "assets/images/Aiseeutepego.jpg",
      audioPath: "./audio/AiSeEuTePego.mp3",
    ),

    //Note: song 4
    Song(
      songName: "Casanova",
      artistName: 'Soolking and Gazo song',
      albumArtImagePath: "assets/images/Casanova.png",
      audioPath: "./audio/Casanova.mp3",
    ),

    //Note: song 5
    Song(
      songName: "Cesta",
      artistName: 'Kryštof',
      albumArtImagePath: "assets/images/cesta.jpg",
      audioPath: "./audio/cesta.mp3",
    ),

    //Note: song 6
    Song(
      songName: "Bára",
      artistName: 'Kabát',
      albumArtImagePath: "assets/images/bara.jpg",
      audioPath: "./audio/Bara.mp3",
    ),

    //Note: song 7
    Song(
      songName: "Blonde Chaya",
      artistName: 'Amaru x Gringo',
      albumArtImagePath: "assets/images/blondechaya.jpg",
      audioPath: "./audio/blondechaya.mp3",
    ),

    //Note: song 8
    Song(
      songName: "Balada",
      artistName: 'Gusttavo Lima',
      albumArtImagePath: "assets/images/Balada.jpg",
      audioPath: "./audio/Balada.mp3",
    ),

    //Note: song 9
    Song(
      songName: "Anděl",
      artistName: 'Xindl X',
      albumArtImagePath: "assets/images/Anděl.jpg",
      audioPath: "./audio/Anděl.mp3",
    ),

    //Note: song 10
    Song(
      songName: "Club Can't Handle Me",
      artistName: 'Flo Rida',
      albumArtImagePath: "assets/images/ClubCan'tHandleMe.jpg",
      audioPath: "./audio/ClubCantHandleMe.mp3",
    ),
  ];

  //Note: get current playing song index
  int? _currentSongIndex;

  //Info: AUDIOPLAYER
  //Note: audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //Note: durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //Note: constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //Note: innitialy not playing
  bool _isPlaying = false;

  //Note: play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;

    //Note: stop current song
    await _audioPlayer.stop();

    //Note: play new song
    await _audioPlayer.play(AssetSource(path));

    _isPlaying = true;
    notifyListeners();
  }

  //Note: pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //Note: resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //Note: pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }

    notifyListeners();
  }

  //Note: seek to a specific position
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //Note: play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      //Info: go to next song if it's not the last song
      if (_currentSongIndex! < _playlist.length - 1) {
        //Note: increment current song index
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //Note: go to first song
        currentSongIndex = 0;
      }
    }
  }

  //Note: play previous song
  void playPreviousSong() async {
    //Info: if more than 2 seconds passed, replay the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //Info: else, play previous song
    else {
      if (currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        //Info: if it's the first song, go back the last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //Note: listen to duration
  void listenToDuration() {
    //Note: listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //Note: listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //Note: listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
  //Note: dispose audio player

  //Info: GETTERS
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //Info: SETTERS
  set currentSongIndex(int? newIndex) {
    //Note: update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      //Note: Play the song at the new index
      play();
    }

    //Note: update UI
    notifyListeners();
  }
}
