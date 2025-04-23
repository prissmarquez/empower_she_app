import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videopage extends StatefulWidget {
  const Videopage({super.key});

  @override
  State<Videopage> createState() => _VideopageState();
}

class _VideopageState extends State<Videopage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=fq4N0hgOWzU',
      )!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 186, 210),
      appBar: AppBar(
        title: const Text('Video Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              "Primer video ",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Center(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _youtubeController,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.pink,
              ),

              //callback
              //Flutter lo va a ejecutar después, cuando el video (player) ya esté listo.
              builder: (context, player) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: player,
                    ),

                    //estrellitas del progreso
                    const Padding(
                      padding: EdgeInsets.only(left: 249, top: 12),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Color.fromARGB(255, 158, 127, 35), size: 16),
                          Icon(Icons.star, color: Color.fromARGB(255, 158, 127, 35), size: 16),
                          Icon(Icons.star, color: Color.fromARGB(255, 158, 127, 35), size: 16),
                          Icon(Icons.star, color: Color.fromARGB(255, 158, 127, 35), size: 16),
                          Icon(Icons.star_border, color: Color.fromARGB(255, 158, 127, 35), size: 16),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Center(child: Text("descripcion")),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
