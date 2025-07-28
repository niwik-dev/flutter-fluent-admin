import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class ShortVideoPage extends StatefulWidget {
  const ShortVideoPage({super.key});

  @override
  State<ShortVideoPage> createState() => _VideoPageState();
}

class _ShortVideoPageState extends State<ShortVideoPage> {
  late VideoController videoController;
  late Player player;

  @override
  void initState() {
    super.initState();
    player = Player();
    videoController = VideoController(player);

    player.open(
      Media(
        'https://media.w3.org/2010/05/sintel/trailer_hd.mp4',
      ),
    );
    player.play();
  }

  @override
  void dispose() {
    videoController.player.dispose();
    videoController.notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Video(
            controller: videoController,
          )
        )
      ],
    );
  }
}