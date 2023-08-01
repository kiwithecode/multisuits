import 'package:ccg_aplicacion_movil/models/viideos_list.dart';
import 'package:ccg_aplicacion_movil/service/YoutubeApiService.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MensajesView extends StatefulWidget {
  @override
  _MensajesViewState createState() => _MensajesViewState();
}

class _MensajesViewState extends State<MensajesView> {
  late Future<VideosList> _videoList;

  @override
  void initState() {
    super.initState();
    _videoList = Services.getVideosList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder<VideosList>(
        future: _videoList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.videos.length,
              itemBuilder: (context, index) {
                var video = snapshot.data!.videos[index];
                var _controller = YoutubePlayerController(
                  initialVideoId: video.video.resourceId.videoId,
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                );
                return YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: const Color.fromARGB(255, 255, 255, 255),
                  progressColors: ProgressBarColors(
                    playedColor: const Color.fromARGB(255, 255, 255, 255),
                    handleColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
