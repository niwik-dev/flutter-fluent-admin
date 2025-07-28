import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

VideoController useVideoController({
  required Player player
}){ 
  return VideoController(player);
}

class _VideoControllerHook extends Hook<VideoController> { 
  const _VideoControllerHook({
    required this.player
  });

  final Player player;

  @override
  _VideoControllerHookState createState() => _VideoControllerHookState();
}

class _VideoControllerHookState extends HookState<VideoController,_VideoControllerHook>{ 
  late VideoController controller;

  @override
  void initHook() {
    super.initHook();
    controller = VideoController(hook.player);
  }

  @override
  VideoController build(BuildContext context) {
    return controller;
  }

  @override
  void dispose() {
    controller.notifier.dispose();
  }
}