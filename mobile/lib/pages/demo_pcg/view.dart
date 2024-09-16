import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerView extends StatefulWidget {
  const AudioPlayerView({super.key});

  @override
  _AudioPlayerViewState createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setAsset('assets/pcg_example.mp3');
  }

  void _restart() async {
    await _player.seek(Duration.zero); // Seek to the start
    _player.play(); // Play from the start
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _player.play();
              },
              child: const Text('Play'),
            ),
            ElevatedButton(
              onPressed: () {
                _player.pause();
              },
              child: const Text('Pause'),
            ),
            ElevatedButton(
              onPressed: _restart,
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
