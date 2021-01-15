import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  bool playing = false; // variable qui va permettre de dire à la musique d'etre sur pause ou de s'arreter
  IconData playBtn = Icons.play_arrow; // bouton play


  AudioPlayer _player; //declaration de la musique
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  //design
  Widget slider() {
    if(position.inSeconds == 0) {
      return Text("");
    }
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.deepPurple,
          inactiveColor: Colors.grey[350],
          value: position.inSeconds != 0 ? position.inSeconds.toDouble() : 0.01,
          max: musicLength.inSeconds != 0 ? musicLength.inSeconds.toDouble() : 0.01,
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //fonction qui permet de voir la durée de la musique
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //initialisation du player
  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //permet de modifier la durée de la musique
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    //curseur qui permet de voir ou en est la musique
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Lecteur"),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ //fond de la page
                Colors.black,
                Colors.deepPurple[200],
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Ma musique",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Vous écoutez disco",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

                Center(
                  child: Container(
                    width: 300.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                  //    color : Colors.black26,
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/music.jpg"), //photo de la musique
                        )),
                  ),
                ),


                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Text(
                    "Disco",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Expanded( //le container avec les icones et la barre de de la musique
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        //Let's start by adding the controller
                        //let's add the time indicator text

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text( //permet d'afficher le temps
                                "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              slider(),
                              Text(
                                "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.white70,
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_previous,
                              ),
                            ),
                            IconButton(
                              iconSize: 62.0,
                              color: Colors.white,
                              onPressed: () {
                                //here we will add the functionality of the play button
                                if (!playing) {
                                  //now let's play the song
                                  cache.play("playlist/disco.mp3");
                                  setState(() {
                                    playBtn = Icons.pause;
                                    playing = true;
                                  });
                                } else {
                                  _player.pause();
                                  setState(() {
                                    playBtn = Icons.play_arrow;
                                    playing = false;
                                  });
                                }
                              },
                              icon: Icon(
                                playBtn,
                              ),
                            ),
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.white70,
                              icon: Icon(Icons.stop),
                              onPressed: (){
                                _player.stop();

                                setState(() {
                                  playing = false;
                                });

                              },
                            ),
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.white70,
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_next,
                              ),
                            ),


                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}