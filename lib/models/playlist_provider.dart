import 'dart:math';

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

    //Note: song 11
    Song(
      songName: "Colapso",
      artistName: 'Kevin Kaarl',
      albumArtImagePath: "assets/images/Colapso.jpg",
      audioPath: "./audio/Colapso.mp3",
    ),

    //Note: song 12
    Song(
      songName: "Corrida",
      artistName: 'Kabát',
      albumArtImagePath: "assets/images/corrida.jpg",
      audioPath: "./audio/Kabt-Corrida.mp3",
    ),

    //Note: song 13
    Song(
      songName: "Die with a smile",
      artistName: 'Lady Gaga a Bruno Mars',
      albumArtImagePath: "assets/images/diewithsmile.jpg",
      audioPath: "./audio/diewithsmile.mp3",
    ),

    //Note: song 14
    Song(
      songName: "Dole v dole",
      artistName: 'Kabát',
      albumArtImagePath: "assets/images/Dolevdole.jpg",
      audioPath: "./audio/Dolevdole.mp3",
    ),

    //Note: song 15
    Song(
      songName: "El mismo sol",
      artistName: 'Alvaro Soler',
      albumArtImagePath: "assets/images/ElMismoSol.jpg",
      audioPath: "./audio/BVj8K7PEqqSG9aCamPJ\$",
    ),

    //Note: song 16
    Song(
      songName: "Follow you",
      artistName: 'Noizy',
      albumArtImagePath: "assets/images/Followyou.jpg",
      audioPath: "./audio/Followyou.mp3",
    ),

    //Info: NIK SECTION

    //Note: song 1
    Song(
      songName: "Black Friday",
      artistName: 'Tom Odell',
      albumArtImagePath: "assets/images/BlackFriday.jpg",
      audioPath: "./audio/BlackFriday.mp3",
    ),

    //Note: song 1
    Song(
      songName: "Car's Outside",
      artistName: 'James Arthur',
      albumArtImagePath: "assets/images/CarsOutside.jpg",
      audioPath: "./audio/CarsOutside.mp3",
    ),

    //Note: song 1
    Song(
      songName: "Girl of My Dreams",
      artistName: 'Guti',
      albumArtImagePath: "assets/images/GirlofMyDreams.jpg",
      audioPath: "./audio/GirlofMyDreams.mp3",
    ),

    //Note: song 1
    Song(
      songName: "Idea 22",
      artistName: 'Gibran Alcocer',
      albumArtImagePath: "assets/images/Idea22.jpg",
      audioPath: "./audio/Idea22.mp3",
    ),

    //Note: song 1
    Song(
      songName: "Infinity",
      artistName: 'Jaymes Young',
      albumArtImagePath: "assets/images/Infinity.jpg",
      audioPath: "./audio/Infinity.mp3",
    ),

    //Note: song 1
    Song(
      songName: "Juliet",
      artistName: 'Cavetown',
      albumArtImagePath: "assets/images/Juliet.jpg",
      audioPath: "./audio/Juliet.mp3",
    ),

    //Note: song 1
    Song(
      songName: "Let Me Down Slowly",
      artistName: 'Alec Benjamin',
      albumArtImagePath: "assets/images/LetMeDownSlowly.jpg",
      audioPath: "./audio/LetMeDownSlowly.mp3",
    ),

    //Note: song 2
    Song(
      songName: "Smells Like Teen Spirit",
      artistName: 'Nirvana',
      albumArtImagePath:
          "assets/images/NirvanaSmellsLikeTeenSpirit.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath:
          "./audio/NirvanaSmellsLikeTeenSpirit.mp3", //./audio/NirvanaSmellsLikeTeenSpirit.mp3
    ),

    //Note: song 2
    Song(
      songName: "People Help the People",
      artistName: 'Birdy',
      albumArtImagePath:
          "assets/images/PeopleHelpThePeople.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath:
          "./audio/PeopleHelpThePeople.mp3", //./audio/NirvanaSmellsLikeTeenSpirit.mp3
    ),

    //Note: song 3
    Song(
      songName: "Sailor Song",
      artistName: 'Gigi Perez',
      albumArtImagePath:
          "assets/images/SailorSong.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath:
          "./audio/SailorSong.mp3", //./audio/NirvanaSmellsLikeTeenSpirit.mp3
    ),

    //Note: song 4
    Song(
      songName: "Si No Estás",
      artistName: 'iñigo quintero',
      albumArtImagePath:
          "assets/images/SiNoEstás.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath:
          "./audio/SiNoEstás.mp3", //./audio/NirvanaSmellsLikeTeenSpirit.mp3
    ),

    //Note: song 4
    Song(
      songName: "Someone Like You",
      artistName: 'Adele',
      albumArtImagePath:
          "assets/images/SomeoneLikeYou.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath:
          "./audio/SomeoneLikeYou.mp3", //./audio/NirvanaSmellsLikeTeenSpirit.mp3
    ),

    //Note: song 5
    Song(
      songName: "Tek It",
      artistName: 'Cafuné ',
      albumArtImagePath:
          "assets/images/TekIt.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath: "./audio/TekIt.mp3", //./audio/NirvanaSmellsLikeTeenSpirit.mp3
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

  void playRandomNextSong() {
    if (_currentSongIndex != null) {
      //Info: go to next song if it's not the last song
      if (_currentSongIndex! < _playlist.length - 1) {
        //Note: increment current song index
        int random = Random().nextInt(100);
        currentSongIndex = _currentSongIndex! + random;
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
