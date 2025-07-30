import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../../utils/format_utils.dart';
import '../../model/view/video_info.dart';
import '../../pages/short_video/common/p_video_loading.dart';
import '../../service/short_video/short_video_service.dart';
import '../../store/short_video/short_video_store.dart';
import 'common/p_user_avatar.dart';

part 'short_video_page.g.dart';


@swidget
Widget shortVideoSideBar(
  BuildContext context,
  {
    required VideoInfo? videoInfo
  }
){
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Wrap(
      spacing: 4,
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        videoInfo!=null?
        NetworkVideoAuthorAvatar(
          avatarUrl: videoInfo.authorThumbUrl!,
        )
        :
        const DefaultVideoAuthorAvatar(),
        IconButton(
          icon: const Icon(
            FluentIcons.comment_solid,
            size: 32,
          ),
          onPressed: (){},
        ),

        videoInfo!=null&&videoInfo.commentCount!=null?
        Text(FormatUtils.formatNumber(videoInfo.commentCount)):
        const Text('评论'),

        IconButton(
          icon: const Icon(
            FluentIcons.like_solid,
            size: 32,
          ),
          onPressed: (){},
        ),
        videoInfo!=null&&videoInfo.diggCount!=null?
        Text(FormatUtils.formatNumber(videoInfo.diggCount)):
        const Text('点赞'),

        IconButton(
          icon: const Icon(
            FluentIcons.favorite_star_fill,
            size: 32,
          ),
          onPressed: (){},
        ),

        videoInfo!=null&&videoInfo.collectCount!=null?
        Text(FormatUtils.formatNumber(videoInfo.collectCount)):
        const Text('收藏'),

        IconButton(
          icon: const Icon(
            FluentIcons.share,
            size: 32,
          ),
          onPressed: (){},
        ),

        videoInfo!=null&&videoInfo.shareCount!=null?
        Text(FormatUtils.formatNumber(videoInfo.shareCount)):
        const Text('分享')
      ],
    ),
  );
}

@hcwidget
Widget shortVideoPage(BuildContext context, WidgetRef ref){ 
  final shortVideoStore = ref.watch(shortVideoStoreProvider);
  final shortVideoService = ShortVideoService(ref);

  var isPlaying = useState(false);
  var player = useMemoized(() => Player());
  final videoController = useMemoized(() => VideoController(player));
  final PageController pageController = usePageController();
  
  useEffect(() {
    player.stream.playlist.listen((playlist) {
      isPlaying.value = playlist.medias.isNotEmpty;
    });

    if(shortVideoStore.videoList.isEmpty){
      shortVideoService.loadNewShortVideoList().then(
        (_) {
          player.open(
            Media(
              shortVideoService.getCurrentVideo()!.videoUrl!
            )
          );
        }
      );
    }else{
      player.open(
        Media(
          shortVideoService.getCurrentVideo()!.videoUrl!
        )
      );
    }
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16)
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16
      ),
      child: isPlaying.value ?
      Stack(
        children: [
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
              shortVideoService.gotoVideoAt(index).then(
                (VideoInfo? videoInfo) {
                  player.open(
                    Media(
                      videoInfo!.videoUrl!
                    )
                  );
                }
              );
            },
          ),

          // 右侧边栏
          Align(
            alignment: Alignment.centerRight,
            child: ShortVideoSideBar(
              videoInfo: shortVideoService.getCurrentVideo()
            ),
          )
        ],
      ) : const VideoLoading()
    )
  );
}