import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/neu_box.dart';
import 'package:flutter_music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
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
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back)),

                      //Note: title
                      Text("PLAYLIST"),

                      //Note: menu button
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
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
                          child: Image.asset("assets/images/DarkGraveLogo.png"),
                        ),

                        //Note: song, artist name and heart icon
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Note: song and artist name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Outside",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text("Harris")
                                ],
                              ),

                              //Note: heart icon
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Note: start time
                            Text("0:00"),

                            //Note: shuffle icon
                            Icon(Icons.shuffle),

                            //Note: repeat icon
                            Icon(Icons.repeat),

                            //Note: end time
                            Text("0:00"),
                          ],
                        ),
                      ),

                      //Note: song progress bar
                      Slider(
                          min: 0,
                          max: 100,
                          value: 50,
                          activeColor: Colors.green,
                          thumbColor: Colors.white,
                          onChanged: (value) {}),
                    ],
                  ),

                  const SizedBox(height: 10),

                  //Note: playback controls
                  Row(
                    children: [
                      //Note: skip previous button
                      Expanded(
                          child: GestureDetector(
                              onTap: () {},
                              child: NeuBox(child: Icon(Icons.skip_previous)))),

                      const SizedBox(width: 20),

                      //Note: play/pause button
                      Expanded(
                          flex: 2,
                          child: GestureDetector(
                              onTap: () {},
                              child: NeuBox(child: Icon(Icons.play_arrow)))),

                      const SizedBox(width: 20),

                      //Note: skip forward button
                      Expanded(
                          child: GestureDetector(
                              onTap: () {},
                              child: NeuBox(child: Icon(Icons.skip_next)))),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
