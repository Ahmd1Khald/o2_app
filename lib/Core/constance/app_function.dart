import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class AppFunctions {
  static void pushTo({required context, required Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static final assetsAudioPlayer = AssetsAudioPlayer();

  static Future<void> playAlert() async {
    try {
      // Load the audio file from assets
      await assetsAudioPlayer
          .open(
            Audio("assets/sounds/alert.mp3"),
          )
          .then((value) {});
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> pauseAlert() async {
    try {
      // Load the audio file from assets
      await assetsAudioPlayer.stop();
    } catch (e) {
      print('Error: $e');
    }
  }

  static void sendAlertMessage({
    required int ratio,
  }) {
    Share.share(
      'Your state is in danger!!\nThe oxygen levels have reached a concerning level of $ratio%\nPlease help urgently.',
      subject: '',
    );
  }
}
