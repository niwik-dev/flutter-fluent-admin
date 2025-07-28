import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../../pages/short_video/common/p_video_loading.dart';
import '../../service/short_video/short_video_service.dart';
import '../../store/short_video/short_video_store.dart';

part 'short_video_page.g.dart';


@hcwidget
Widget shortVideoPage(BuildContext context, WidgetRef ref){ 
  final shortVideoStore = ref.watch(shortVideoStoreProvider);
  final shortVideoService = ShortVideoService(ref);

  var player = useMemoized(() => Player());
  final videoController = useMemoized(() => VideoController(player));
  final PageController pageController = usePageController();
  
  useEffect(() {
    shortVideoService.loadNewShortVideoList().then(
      (_) {
        player.open(
          Media(
            shortVideoService.getCurrentVideo().videoUrl!
          )
        );
      }
    );
    return () => player.dispose();
  }, []);

  return ScaffoldPage(
    header: PageHeader(
      title: Text(
        '短视频',
        style: FluentTheme.of(context).typography.title,
      ),
    ),
    content: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16
      ),
      child: shortVideoService.isVideoLoadingFinished() && player.state.playing ?
      PageView.builder(
        scrollDirection: Axis.vertical,
        controller: pageController,
        itemCount: shortVideoStore.videoList.length,
        itemBuilder: (context, index){
          return Video(
            controller: videoController,
          );
        },
        onPageChanged: (index){
          shortVideoService.gotoNextVideo();
          player.open(
            Media(shortVideoService.getCurrentVideo().videoUrl!)
          );
        },
      ) : const VideoLoading()
    )
  );
}