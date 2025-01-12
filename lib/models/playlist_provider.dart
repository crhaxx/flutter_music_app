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
      songIndex: 1,
    ),

    //Note: song 2
    Song(
      songName: "Addicted To You",
      artistName: 'Picture This',
      albumArtImagePath: "assets/images/AddictedToYou.jpg",
      audioPath: "./audio/AddictedToYou.mp3",
      songIndex: 2,
    ),

    //Note: song 3
    Song(
      songName: "Ai se eu te pego",
      artistName: 'Michel Teló',
      albumArtImagePath: "assets/images/Aiseeutepego.jpg",
      audioPath: "./audio/AiSeEuTePego.mp3",
      songIndex: 3,
    ),

    //Note: song 4
    Song(
      songName: "Casanova",
      artistName: 'Soolking and Gazo song',
      albumArtImagePath: "assets/images/Casanova.png",
      audioPath: "./audio/Casanova.mp3",
      songIndex: 4,
    ),

    //Note: song 5
    Song(
      songName: "Cesta",
      artistName: 'Kryštof',
      albumArtImagePath: "assets/images/cesta.jpg",
      audioPath: "./audio/cesta.mp3",
      songIndex: 5,
    ),

    //Note: song 6
    Song(
      songName: "Bára",
      artistName: 'Kabát',
      albumArtImagePath: "assets/images/bara.jpg",
      audioPath: "./audio/Bara.mp3",
      songIndex: 6,
    ),

    //Note: song 7
    Song(
      songName: "Blonde Chaya",
      artistName: 'Amaru x Gringo',
      albumArtImagePath: "assets/images/blondechaya.jpg",
      audioPath: "./audio/blondechaya.mp3",
      songIndex: 7,
    ),

    //Note: song 8
    Song(
      songName: "Balada",
      artistName: 'Gusttavo Lima',
      albumArtImagePath: "assets/images/Balada.jpg",
      audioPath: "./audio/Balada.mp3",
      songIndex: 8,
    ),

    //Note: song 9
    Song(
      songName: "Anděl",
      artistName: 'Xindl X',
      albumArtImagePath: "assets/images/Anděl.jpg",
      audioPath: "./audio/Anděl.mp3",
      songIndex: 9,
    ),

    //Note: song 10
    Song(
      songName: "Club Can't Handle Me",
      artistName: 'Flo Rida',
      albumArtImagePath: "assets/images/ClubCan'tHandleMe.jpg",
      audioPath: "./audio/ClubCantHandleMe.mp3",
      songIndex: 10,
    ),

    //Note: song 11
    Song(
      songName: "Colapso",
      artistName: 'Kevin Kaarl',
      albumArtImagePath: "assets/images/Colapso.jpg",
      audioPath: "./audio/Colapso.mp3",
      songIndex: 11,
    ),

    //Note: song 12
    Song(
      songName: "Corrida",
      artistName: 'Kabát',
      albumArtImagePath: "assets/images/corrida.jpg",
      audioPath: "./audio/Kabt-Corrida.mp3",
      songIndex: 12,
    ),

    //Note: song 13
    Song(
      songName: "Die with a smile",
      artistName: 'Lady Gaga a Bruno Mars',
      albumArtImagePath: "assets/images/diewithsmile.jpg",
      audioPath: "./audio/diewithsmile.mp3",
      songIndex: 13,
    ),

    //Note: song 14
    Song(
      songName: "Dole v dole",
      artistName: 'Kabát',
      albumArtImagePath: "assets/images/Dolevdole.jpg",
      audioPath: "./audio/Dolevdole.mp3",
      songIndex: 14,
    ),

    //Note: song 15
    Song(
      songName: "El mismo sol",
      artistName: 'Alvaro Soler',
      albumArtImagePath: "assets/images/ElMismoSol.jpg",
      audioPath: "./audio/BVj8K7PEqqSG9aCamPJ\$",
      songIndex: 15,
    ),

    //Note: song 16
    Song(
      songName: "Follow you",
      artistName: 'Noizy',
      albumArtImagePath: "assets/images/Followyou.jpg",
      audioPath: "./audio/Followyou.mp3",
      songIndex: 16,
    ),

    //Note: song 17
    Song(
      songName: "I Believe",
      artistName: 'KAMRAD',
      albumArtImagePath: "assets/images/IBelieve.jpg",
      audioPath: "./audio/IBelieve.mp3",
      songIndex: 17,
    ),

    //Note: song 18
    Song(
      songName: "Joy",
      artistName: 'Kabát',
      albumArtImagePath: "./assets/images/corrida.jpg",
      audioPath: "./audio/Joy.mp3",
      songIndex: 18,
    ),

    //Note: song 19
    Song(
      songName: "Iris",
      artistName: 'Goo Goo Dolls',
      albumArtImagePath: "assets/images/Iris.jpg",
      audioPath: "./audio/Iris.mp3",
      songIndex: 19,
    ),

    //Note: song 20
    Song(
      songName: "Maluma - Hola",
      artistName: 'Flo Rida',
      albumArtImagePath: "assets/images/MalumaHola.jpg",
      audioPath: "./audio/MalumaHola.mp3",
      songIndex: 20,
    ),

    //Note: song 21
    Song(
      songName: "Kostlivci",
      artistName: 'Kabát',
      albumArtImagePath: "assets/images/corrida.jpg",
      audioPath: "./audio/Kostlivci.mp3",
      songIndex: 21,
    ),

    //Note: song 22
    Song(
      songName: "Křídla z mýdla",
      artistName: 'Kryštof',
      albumArtImagePath: "assets/images/cesta.jpg",
      audioPath: "./audio/Křídlazmýdla.mp3",
      songIndex: 22,
    ),

    //Note: song 23
    Song(
      songName: "La la la",
      artistName: 'Naughty Boy',
      albumArtImagePath: "assets/images/lalala.jpg",
      audioPath: "./audio/Lalala.mp3",
      songIndex: 23,
    ),

    //Note: song 24
    Song(
      songName: "Léto lásky",
      artistName: 'Summer All Stars',
      albumArtImagePath: "assets/images/letolasky.jpg",
      audioPath: "./audio/Ltolásky.mp3",
      songIndex: 24,
    ),

    //Note: song 25
    Song(
      songName: "Malá Dama",
      artistName: 'Kabát',
      albumArtImagePath: "assets/images/corrida.jpg",
      audioPath: "./audio/MalaDama.mp3",
      songIndex: 25,
    ),

    //Note: song 25
    Song(
      songName: "Meet Me Halfway",
      artistName: 'Black Eyed Peas',
      albumArtImagePath: "assets/images/meetmehalfway.jpg",
      audioPath: "./audio/MeetMeHalfway.mp3",
      songIndex: 25,
    ),

    //Note: song 26
    Song(
      songName: "MILANO",
      artistName: 'Pashanim',
      albumArtImagePath: "assets/images/milano.jpg",
      audioPath: "./audio/MILANO.mp3",
      songIndex: 26,
    ),

    //Note: song 27
    Song(
      songName: "NEW DROP",
      artistName: 'Don Toliver',
      albumArtImagePath: "assets/images/newdrop.jpg",
      audioPath: "./audio/NEWDROP.mp3",
      songIndex: 27,
    ),

    //Note: song 27
    Song(
      songName: "On My Head",
      artistName: 'Dan Bárta',
      albumArtImagePath: "assets/images/onmyhead.jpg",
      audioPath: "./audio/OnMyHead.mp3",
      songIndex: 28,
    ),

    //Info: NIK SECTION

    //Note: song 1
    Song(
      songName: "Black Friday",
      artistName: 'Tom Odell',
      albumArtImagePath: "assets/images/BlackFriday.jpg",
      audioPath: "./audio/BlackFriday.mp3",
      songIndex: 101,
    ),

    //Note: song 1
    Song(
      songName: "Car's Outside",
      artistName: 'James Arthur',
      albumArtImagePath: "assets/images/CarsOutside.jpg",
      audioPath: "./audio/CarsOutside.mp3",
      songIndex: 102,
    ),

    //Note: song 1
    Song(
      songName: "Girl of My Dreams",
      artistName: 'Guti',
      albumArtImagePath: "assets/images/GirlofMyDreams.jpg",
      audioPath: "./audio/GirlofMyDreams.mp3",
      songIndex: 103,
    ),

    //Note: song 1
    Song(
      songName: "Idea 22",
      artistName: 'Gibran Alcocer',
      albumArtImagePath: "assets/images/Idea22.jpg",
      audioPath: "./audio/Idea22.mp3",
      songIndex: 104,
    ),

    //Note: song 1
    Song(
      songName: "Infinity",
      artistName: 'Jaymes Young',
      albumArtImagePath: "assets/images/Infinity.jpg",
      audioPath: "./audio/Infinity.mp3",
      songIndex: 105,
    ),

    //Note: song 1
    Song(
      songName: "Juliet",
      artistName: 'Cavetown',
      albumArtImagePath: "assets/images/Juliet.jpg",
      audioPath: "./audio/Juliet.mp3",
      songIndex: 106,
    ),

    //Note: song 1
    Song(
      songName: "Let Me Down Slowly",
      artistName: 'Alec Benjamin',
      albumArtImagePath: "assets/images/LetMeDownSlowly.jpg",
      audioPath: "./audio/LetMeDownSlowly.mp3",
      songIndex: 107,
    ),

    //Note: song 2
    Song(
      songName: "Smells Like Teen Spirit",
      artistName: 'Nirvana',
      albumArtImagePath:
          "assets/images/NirvanaSmellsLikeTeenSpirit.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath: "./audio/NirvanaSmellsLikeTeenSpirit.mp3",
      songIndex: 108, //./audio/NirvanaSmellsLikeTeenSpirit.mp3
    ),

    //Note: song 2
    Song(
      songName: "People Help the People",
      artistName: 'Birdy',
      albumArtImagePath:
          "assets/images/PeopleHelpThePeople.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath: "./audio/PeopleHelpThePeople.mp3",
      songIndex: 109, //./audio/NirvanaSmellsLikeTeenSpirit.mp3
    ),

    //Note: song 3
    Song(
      songName: "Sailor Song",
      artistName: 'Gigi Perez',
      albumArtImagePath:
          "assets/images/SailorSong.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath: "./audio/SailorSong.mp3",
      songIndex: 110, //./audio/NirvanaSmellsLikeTeenSpirit.mp3
    ),

    //Note: song 4
    Song(
      songName: "Si No Estás",
      artistName: 'iñigo quintero',
      albumArtImagePath: "assets/images/SiNoEstás.jpg",
      audioPath: "./audio/SiNoEstás.mp3",
      songIndex: 111,
    ),

    //Note: song 4
    Song(
      songName: "Someone Like You",
      artistName: 'Adele',
      albumArtImagePath:
          "assets/images/SomeoneLikeYou.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath: "./audio/SomeoneLikeYou.mp3",
      songIndex: 112,
    ),

    //Note: song 5
    Song(
      songName: "Tek It",
      artistName: 'Cafuné ',
      albumArtImagePath:
          "assets/images/TekIt.jpg", //assets/images/NirvanaSmellsLikeTeenSpirit.jpg
      audioPath: "./audio/TekIt.mp3",
      songIndex: 113, //./audio/NirvanaSmellsLikeTeenSpirit.mp3
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

  bool playRandom = false;
  bool repeatSong = false;

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
      if (!playRandom) {
        //Info: go to next song if it's not the last song
        if (_currentSongIndex! < _playlist.length - 1) {
          //Note: increment current song index
          currentSongIndex = _currentSongIndex! + 1;
        } else {
          //Note: go to first song
          currentSongIndex = 0;
        }
      } else {
        //Info: PLAY RANDOM SONG
        int randomNumber = 1;

        Random random = Random();
        randomNumber = random.nextInt(10);

        if (randomNumber == 0) randomNumber + 3;

        //Note: increment current song index
        if (_currentSongIndex! + randomNumber > _playlist.length - 1) {
          currentSongIndex = _currentSongIndex! - randomNumber;
        } else {
          currentSongIndex = _currentSongIndex! + randomNumber;
        }
      }
    }
  }

  //Note: play next song
  void repeatCurrentSong() {
    if (_currentSongIndex != null) {
      currentSongIndex = _currentSongIndex;
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
      if (repeatSong) {
        repeatCurrentSong();
      } else {
        playNextSong();
      }
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
