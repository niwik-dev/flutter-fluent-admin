// To parse this JSON data, do
//
//     final fetchHomeFeed = fetchHomeFeedFromJson(jsonString);

import 'dart:convert';

FetchHomeFeedResponse fetchHomeFeedFromJson(String str) => FetchHomeFeedResponse.fromJson(json.decode(str));

String fetchHomeFeedToJson(FetchHomeFeedResponse data) => json.encode(data.toJson());

class FetchHomeFeedResponse {
  List<AwemeList>? awemeList;
  int? hasMore;
  LogPb? logPb;
  int? statusCode;

  FetchHomeFeedResponse({
    this.awemeList,
    this.hasMore,
    this.logPb,
    this.statusCode,
  });

  factory FetchHomeFeedResponse.fromJson(Map<String, dynamic> json) => FetchHomeFeedResponse(
    awemeList: json["aweme_list"] == null ? [] : List<AwemeList>.from(json["aweme_list"]!.map((x) => AwemeList.fromJson(x))),
    hasMore: json["has_more"],
    logPb: json["log_pb"] == null ? null : LogPb.fromJson(json["log_pb"]),
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "aweme_list": awemeList == null ? [] : List<dynamic>.from(awemeList!.map((x) => x.toJson())),
    "has_more": hasMore,
    "log_pb": logPb?.toJson(),
    "status_code": statusCode,
  };
}

class AwemeList {
  dynamic adCandidates;
  Author? author;
  int? authorUserId;
  String? awemeId;
  int? awemeType;
  CellRoom? cellRoom;
  dynamic chapterBarColor;
  dynamic chapterList;
  dynamic commerceTopLabels;
  dynamic createScaleType;
  dynamic dislikeDimensionList;
  dynamic dislikeDimensionListV2;
  String? groupId;
  dynamic imSharedUidList;
  dynamic images;
  dynamic imgBitrate;
  dynamic jumpTabInfoList;
  String? liveSortInfo;
  dynamic musicGuidanceTagList;
  dynamic mvInfo;
  dynamic originalImages;
  int? previewVideoStatus;
  dynamic refTtsIdList;
  dynamic refVoiceModifyIdList;
  dynamic relationLabels;
  dynamic replySmartEmojis;
  String? respFrom;
  AwemeListShareInfo? shareInfo;
  dynamic shareRankSecUidList;
  dynamic slidesMusicBeats;
  Statistics? statistics;
  AwemeListStatus? status;
  List<TextExtra>? textExtra;
  dynamic trendsInfos;
  dynamic ttsIdList;
  Video? video;
  List<VideoTag>? videoTag;
  dynamic voiceModifyIdList;
  dynamic yummeRecreason;
  String? authenticationToken;
  AwemeControl? awemeControl;
  bool? canCacheToLocal;
  String? caption;
  int? collectStat;
  int? createTime;
  DanmakuControl? danmakuControl;
  String? desc;
  Descendants? descendants;
  EntertainmentProductInfo? entertainmentProductInfo;
  FeedCommentConfig? feedCommentConfig;
  int? horizontalType;
  int? imageCropCtrl;
  ImpressionData? impressionData;
  bool? isAds;
  bool? isHorizontal;
  bool? isImageBeat;
  bool? isLifeItem;
  int? isStory;
  int? isTop;
  String? itemTitle;
  int? mediaType;
  MixInfo? mixInfo;
  Music? music;
  int? pcGuideChannelId;
  PhotoSearchEntrance? photoSearchEntrance;
  bool? preventDownload;
  dynamic rawAdData;
  String? region;
  RiskInfos? riskInfos;
  String? shareUrl;
  SuggestWords? suggestWords;
  int? userDigged;
  int? userRecommendStatus;
  VideoControl? videoControl;
  VisualSearchInfo? visualSearchInfo;
  String? webRawData;

  AwemeList({
    this.adCandidates,
    this.author,
    this.authorUserId,
    this.awemeId,
    this.awemeType,
    this.cellRoom,
    this.chapterBarColor,
    this.chapterList,
    this.commerceTopLabels,
    this.createScaleType,
    this.dislikeDimensionList,
    this.dislikeDimensionListV2,
    this.groupId,
    this.imSharedUidList,
    this.images,
    this.imgBitrate,
    this.jumpTabInfoList,
    this.liveSortInfo,
    this.musicGuidanceTagList,
    this.mvInfo,
    this.originalImages,
    this.previewVideoStatus,
    this.refTtsIdList,
    this.refVoiceModifyIdList,
    this.relationLabels,
    this.replySmartEmojis,
    this.respFrom,
    this.shareInfo,
    this.shareRankSecUidList,
    this.slidesMusicBeats,
    this.statistics,
    this.status,
    this.textExtra,
    this.trendsInfos,
    this.ttsIdList,
    this.video,
    this.videoTag,
    this.voiceModifyIdList,
    this.yummeRecreason,
    this.authenticationToken,
    this.awemeControl,
    this.canCacheToLocal,
    this.caption,
    this.collectStat,
    this.createTime,
    this.danmakuControl,
    this.desc,
    this.descendants,
    this.entertainmentProductInfo,
    this.feedCommentConfig,
    this.horizontalType,
    this.imageCropCtrl,
    this.impressionData,
    this.isAds,
    this.isHorizontal,
    this.isImageBeat,
    this.isLifeItem,
    this.isStory,
    this.isTop,
    this.itemTitle,
    this.mediaType,
    this.mixInfo,
    this.music,
    this.pcGuideChannelId,
    this.photoSearchEntrance,
    this.preventDownload,
    this.rawAdData,
    this.region,
    this.riskInfos,
    this.shareUrl,
    this.suggestWords,
    this.userDigged,
    this.userRecommendStatus,
    this.videoControl,
    this.visualSearchInfo,
    this.webRawData,
  });

  factory AwemeList.fromJson(Map<String, dynamic> json) => AwemeList(
    adCandidates: json["ad_candidates"],
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    authorUserId: json["author_user_id"],
    awemeId: json["aweme_id"],
    awemeType: json["aweme_type"],
    cellRoom: json["cell_room"] == null ? null : CellRoom.fromJson(json["cell_room"]),
    chapterBarColor: json["chapter_bar_color"],
    chapterList: json["chapter_list"],
    commerceTopLabels: json["commerce_top_labels"],
    createScaleType: json["create_scale_type"],
    dislikeDimensionList: json["dislike_dimension_list"],
    dislikeDimensionListV2: json["dislike_dimension_list_v2"],
    groupId: json["group_id"],
    imSharedUidList: json["im_shared_uid_list"],
    images: json["images"],
    imgBitrate: json["img_bitrate"],
    jumpTabInfoList: json["jump_tab_info_list"],
    liveSortInfo: json["live_sort_info"],
    musicGuidanceTagList: json["music_guidance_tag_list"],
    mvInfo: json["mv_info"],
    originalImages: json["original_images"],
    previewVideoStatus: json["preview_video_status"],
    refTtsIdList: json["ref_tts_id_list"],
    refVoiceModifyIdList: json["ref_voice_modify_id_list"],
    relationLabels: json["relation_labels"],
    replySmartEmojis: json["reply_smart_emojis"],
    respFrom: json["resp_from"],
    shareInfo: json["share_info"] == null ? null : AwemeListShareInfo.fromJson(json["share_info"]),
    shareRankSecUidList: json["share_rank_sec_uid_list"],
    slidesMusicBeats: json["slides_music_beats"],
    statistics: json["statistics"] == null ? null : Statistics.fromJson(json["statistics"]),
    status: json["status"] == null ? null : AwemeListStatus.fromJson(json["status"]),
    textExtra: json["text_extra"] == null ? [] : List<TextExtra>.from(json["text_extra"]!.map((x) => TextExtra.fromJson(x))),
    trendsInfos: json["trends_infos"],
    ttsIdList: json["tts_id_list"],
    video: json["video"] == null ? null : Video.fromJson(json["video"]),
    videoTag: json["video_tag"] == null ? [] : List<VideoTag>.from(json["video_tag"]!.map((x) => VideoTag.fromJson(x))),
    voiceModifyIdList: json["voice_modify_id_list"],
    yummeRecreason: json["yumme_recreason"],
    authenticationToken: json["authentication_token"],
    awemeControl: json["aweme_control"] == null ? null : AwemeControl.fromJson(json["aweme_control"]),
    canCacheToLocal: json["can_cache_to_local"],
    caption: json["caption"],
    collectStat: json["collect_stat"],
    createTime: json["create_time"],
    danmakuControl: json["danmaku_control"] == null ? null : DanmakuControl.fromJson(json["danmaku_control"]),
    desc: json["desc"],
    descendants: json["descendants"] == null ? null : Descendants.fromJson(json["descendants"]),
    entertainmentProductInfo: json["entertainment_product_info"] == null ? null : EntertainmentProductInfo.fromJson(json["entertainment_product_info"]),
    feedCommentConfig: json["feed_comment_config"] == null ? null : FeedCommentConfig.fromJson(json["feed_comment_config"]),
    horizontalType: json["horizontal_type"],
    imageCropCtrl: json["image_crop_ctrl"],
    impressionData: json["impression_data"] == null ? null : ImpressionData.fromJson(json["impression_data"]),
    isAds: json["is_ads"],
    isHorizontal: json["is_horizontal"],
    isImageBeat: json["is_image_beat"],
    isLifeItem: json["is_life_item"],
    isStory: json["is_story"],
    isTop: json["is_top"],
    itemTitle: json["item_title"],
    mediaType: json["media_type"],
    mixInfo: json["mix_info"] == null ? null : MixInfo.fromJson(json["mix_info"]),
    music: json["music"] == null ? null : Music.fromJson(json["music"]),
    pcGuideChannelId: json["pc_guide_channel_id"],
    photoSearchEntrance: json["photo_search_entrance"] == null ? null : PhotoSearchEntrance.fromJson(json["photo_search_entrance"]),
    preventDownload: json["prevent_download"],
    rawAdData: json["raw_ad_data"],
    region: json["region"],
    riskInfos: json["risk_infos"] == null ? null : RiskInfos.fromJson(json["risk_infos"]),
    shareUrl: json["share_url"],
    suggestWords: json["suggest_words"] == null ? null : SuggestWords.fromJson(json["suggest_words"]),
    userDigged: json["user_digged"],
    userRecommendStatus: json["user_recommend_status"],
    videoControl: json["video_control"] == null ? null : VideoControl.fromJson(json["video_control"]),
    visualSearchInfo: json["visual_search_info"] == null ? null : VisualSearchInfo.fromJson(json["visual_search_info"]),
    webRawData: json["web_raw_data"],
  );

  Map<String, dynamic> toJson() => {
    "ad_candidates": adCandidates,
    "author": author?.toJson(),
    "author_user_id": authorUserId,
    "aweme_id": awemeId,
    "aweme_type": awemeType,
    "cell_room": cellRoom?.toJson(),
    "chapter_bar_color": chapterBarColor,
    "chapter_list": chapterList,
    "commerce_top_labels": commerceTopLabels,
    "create_scale_type": createScaleType,
    "dislike_dimension_list": dislikeDimensionList,
    "dislike_dimension_list_v2": dislikeDimensionListV2,
    "group_id": groupId,
    "im_shared_uid_list": imSharedUidList,
    "images": images,
    "img_bitrate": imgBitrate,
    "jump_tab_info_list": jumpTabInfoList,
    "live_sort_info": liveSortInfo,
    "music_guidance_tag_list": musicGuidanceTagList,
    "mv_info": mvInfo,
    "original_images": originalImages,
    "preview_video_status": previewVideoStatus,
    "ref_tts_id_list": refTtsIdList,
    "ref_voice_modify_id_list": refVoiceModifyIdList,
    "relation_labels": relationLabels,
    "reply_smart_emojis": replySmartEmojis,
    "resp_from": respFrom,
    "share_info": shareInfo?.toJson(),
    "share_rank_sec_uid_list": shareRankSecUidList,
    "slides_music_beats": slidesMusicBeats,
    "statistics": statistics?.toJson(),
    "status": status?.toJson(),
    "text_extra": textExtra == null ? [] : List<dynamic>.from(textExtra!.map((x) => x.toJson())),
    "trends_infos": trendsInfos,
    "tts_id_list": ttsIdList,
    "video": video?.toJson(),
    "video_tag": videoTag == null ? [] : List<dynamic>.from(videoTag!.map((x) => x.toJson())),
    "voice_modify_id_list": voiceModifyIdList,
    "yumme_recreason": yummeRecreason,
    "authentication_token": authenticationToken,
    "aweme_control": awemeControl?.toJson(),
    "can_cache_to_local": canCacheToLocal,
    "caption": caption,
    "collect_stat": collectStat,
    "create_time": createTime,
    "danmaku_control": danmakuControl?.toJson(),
    "desc": desc,
    "descendants": descendants?.toJson(),
    "entertainment_product_info": entertainmentProductInfo?.toJson(),
    "feed_comment_config": feedCommentConfig?.toJson(),
    "horizontal_type": horizontalType,
    "image_crop_ctrl": imageCropCtrl,
    "impression_data": impressionData?.toJson(),
    "is_ads": isAds,
    "is_horizontal": isHorizontal,
    "is_image_beat": isImageBeat,
    "is_life_item": isLifeItem,
    "is_story": isStory,
    "is_top": isTop,
    "item_title": itemTitle,
    "media_type": mediaType,
    "mix_info": mixInfo?.toJson(),
    "music": music?.toJson(),
    "pc_guide_channel_id": pcGuideChannelId,
    "photo_search_entrance": photoSearchEntrance?.toJson(),
    "prevent_download": preventDownload,
    "raw_ad_data": rawAdData,
    "region": region,
    "risk_infos": riskInfos?.toJson(),
    "share_url": shareUrl,
    "suggest_words": suggestWords?.toJson(),
    "user_digged": userDigged,
    "user_recommend_status": userRecommendStatus,
    "video_control": videoControl?.toJson(),
    "visual_search_info": visualSearchInfo?.toJson(),
    "web_raw_data": webRawData,
  };
}

class Author {
  AvatarThumb? avatarThumb;
  dynamic commonInterest;
  List<AvatarThumb>? coverUrl;
  String? customVerify;
  String? enterpriseVerifyReason;
  int? followStatus;
  int? followerStatus;
  bool? isAdFake;
  String? nickname;
  dynamic notSeenItemIdList;
  bool? preventDownload;
  dynamic privateRelationList;
  int? roomId;
  String? secUid;
  AuthorShareInfo? shareInfo;
  String? uid;

  Author({
    this.avatarThumb,
    this.commonInterest,
    this.coverUrl,
    this.customVerify,
    this.enterpriseVerifyReason,
    this.followStatus,
    this.followerStatus,
    this.isAdFake,
    this.nickname,
    this.notSeenItemIdList,
    this.preventDownload,
    this.privateRelationList,
    this.roomId,
    this.secUid,
    this.shareInfo,
    this.uid,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    avatarThumb: json["avatar_thumb"] == null ? null : AvatarThumb.fromJson(json["avatar_thumb"]),
    commonInterest: json["common_interest"],
    coverUrl: json["cover_url"] == null ? [] : List<AvatarThumb>.from(json["cover_url"]!.map((x) => AvatarThumb.fromJson(x))),
    customVerify: json["custom_verify"],
    enterpriseVerifyReason: json["enterprise_verify_reason"],
    followStatus: json["follow_status"],
    followerStatus: json["follower_status"],
    isAdFake: json["is_ad_fake"],
    nickname: json["nickname"],
    notSeenItemIdList: json["not_seen_item_id_list"],
    preventDownload: json["prevent_download"],
    privateRelationList: json["private_relation_list"],
    roomId: json["room_id"],
    secUid: json["sec_uid"],
    shareInfo: json["share_info"] == null ? null : AuthorShareInfo.fromJson(json["share_info"]),
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "avatar_thumb": avatarThumb?.toJson(),
    "common_interest": commonInterest,
    "cover_url": coverUrl == null ? [] : List<dynamic>.from(coverUrl!.map((x) => x.toJson())),
    "custom_verify": customVerify,
    "enterprise_verify_reason": enterpriseVerifyReason,
    "follow_status": followStatus,
    "follower_status": followerStatus,
    "is_ad_fake": isAdFake,
    "nickname": nickname,
    "not_seen_item_id_list": notSeenItemIdList,
    "prevent_download": preventDownload,
    "private_relation_list": privateRelationList,
    "room_id": roomId,
    "sec_uid": secUid,
    "share_info": shareInfo?.toJson(),
    "uid": uid,
  };
}

class AvatarThumb {
  int? height;
  String? uri;
  List<String>? urlList;
  int? width;
  String? urlKey;

  AvatarThumb({
    this.height,
    this.uri,
    this.urlList,
    this.width,
    this.urlKey,
  });

  factory AvatarThumb.fromJson(Map<String, dynamic> json) => AvatarThumb(
    height: json["height"],
    uri: json["uri"],
    urlList: json["url_list"] == null ? [] : List<String>.from(json["url_list"]!.map((x) => x)),
    width: json["width"],
    urlKey: json["url_key"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "uri": uri,
    "url_list": urlList == null ? [] : List<dynamic>.from(urlList!.map((x) => x)),
    "width": width,
    "url_key": urlKey,
  };
}

class AuthorShareInfo {
  String? shareDesc;
  AvatarThumb? shareQrcodeUrl;
  String? shareTitle;
  String? shareTitleMyself;
  String? shareTitleOther;
  String? shareUrl;
  String? shareWeiboDesc;

  AuthorShareInfo({
    this.shareDesc,
    this.shareQrcodeUrl,
    this.shareTitle,
    this.shareTitleMyself,
    this.shareTitleOther,
    this.shareUrl,
    this.shareWeiboDesc,
  });

  factory AuthorShareInfo.fromJson(Map<String, dynamic> json) => AuthorShareInfo(
    shareDesc: json["share_desc"],
    shareQrcodeUrl: json["share_qrcode_url"] == null ? null : AvatarThumb.fromJson(json["share_qrcode_url"]),
    shareTitle: json["share_title"],
    shareTitleMyself: json["share_title_myself"],
    shareTitleOther: json["share_title_other"],
    shareUrl: json["share_url"],
    shareWeiboDesc: json["share_weibo_desc"],
  );

  Map<String, dynamic> toJson() => {
    "share_desc": shareDesc,
    "share_qrcode_url": shareQrcodeUrl?.toJson(),
    "share_title": shareTitle,
    "share_title_myself": shareTitleMyself,
    "share_title_other": shareTitleOther,
    "share_url": shareUrl,
    "share_weibo_desc": shareWeiboDesc,
  };
}

class AwemeControl {
  bool? canComment;
  bool? canForward;
  bool? canShare;
  bool? canShowComment;

  AwemeControl({
    this.canComment,
    this.canForward,
    this.canShare,
    this.canShowComment,
  });

  factory AwemeControl.fromJson(Map<String, dynamic> json) => AwemeControl(
    canComment: json["can_comment"],
    canForward: json["can_forward"],
    canShare: json["can_share"],
    canShowComment: json["can_show_comment"],
  );

  Map<String, dynamic> toJson() => {
    "can_comment": canComment,
    "can_forward": canForward,
    "can_share": canShare,
    "can_show_comment": canShowComment,
  };
}

class CellRoom {
  String? rawdata;

  CellRoom({
    this.rawdata,
  });

  factory CellRoom.fromJson(Map<String, dynamic> json) => CellRoom(
    rawdata: json["rawdata"],
  );

  Map<String, dynamic> toJson() => {
    "rawdata": rawdata,
  };
}

class DanmakuControl {
  List<Activity>? activities;
  int? danmakuCnt;
  bool? enableDanmaku;
  bool? isPostDenied;
  String? passThroughParams;
  String? postDeniedReason;
  int? postPrivilegeLevel;
  bool? skipDanmaku;
  int? smartModeDecision;

  DanmakuControl({
    this.activities,
    this.danmakuCnt,
    this.enableDanmaku,
    this.isPostDenied,
    this.passThroughParams,
    this.postDeniedReason,
    this.postPrivilegeLevel,
    this.skipDanmaku,
    this.smartModeDecision,
  });

  factory DanmakuControl.fromJson(Map<String, dynamic> json) => DanmakuControl(
    activities: json["activities"] == null ? [] : List<Activity>.from(json["activities"]!.map((x) => Activity.fromJson(x))),
    danmakuCnt: json["danmaku_cnt"],
    enableDanmaku: json["enable_danmaku"],
    isPostDenied: json["is_post_denied"],
    passThroughParams: json["pass_through_params"],
    postDeniedReason: json["post_denied_reason"],
    postPrivilegeLevel: json["post_privilege_level"],
    skipDanmaku: json["skip_danmaku"],
    smartModeDecision: json["smart_mode_decision"],
  );

  Map<String, dynamic> toJson() => {
    "activities": activities == null ? [] : List<dynamic>.from(activities!.map((x) => x.toJson())),
    "danmaku_cnt": danmakuCnt,
    "enable_danmaku": enableDanmaku,
    "is_post_denied": isPostDenied,
    "pass_through_params": passThroughParams,
    "post_denied_reason": postDeniedReason,
    "post_privilege_level": postPrivilegeLevel,
    "skip_danmaku": skipDanmaku,
    "smart_mode_decision": smartModeDecision,
  };
}

class Activity {
  int? id;
  int? type;

  Activity({
    this.id,
    this.type,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };
}

class Descendants {
  String? notifyMsg;
  List<String>? platforms;

  Descendants({
    this.notifyMsg,
    this.platforms,
  });

  factory Descendants.fromJson(Map<String, dynamic> json) => Descendants(
    notifyMsg: json["notify_msg"],
    platforms: json["platforms"] == null ? [] : List<String>.from(json["platforms"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "notify_msg": notifyMsg,
    "platforms": platforms == null ? [] : List<dynamic>.from(platforms!.map((x) => x)),
  };
}

class EntertainmentProductInfo {
  int? biz;
  MarketInfo? marketInfo;
  dynamic subTitle;

  EntertainmentProductInfo({
    this.biz,
    this.marketInfo,
    this.subTitle,
  });

  factory EntertainmentProductInfo.fromJson(Map<String, dynamic> json) => EntertainmentProductInfo(
    biz: json["biz"],
    marketInfo: json["market_info"] == null ? null : MarketInfo.fromJson(json["market_info"]),
    subTitle: json["sub_title"],
  );

  Map<String, dynamic> toJson() => {
    "biz": biz,
    "market_info": marketInfo?.toJson(),
    "sub_title": subTitle,
  };
}

class MarketInfo {
  LimitFree? limitFree;
  dynamic marketingTag;

  MarketInfo({
    this.limitFree,
    this.marketingTag,
  });

  factory MarketInfo.fromJson(Map<String, dynamic> json) => MarketInfo(
    limitFree: json["limit_free"] == null ? null : LimitFree.fromJson(json["limit_free"]),
    marketingTag: json["marketing_tag"],
  );

  Map<String, dynamic> toJson() => {
    "limit_free": limitFree?.toJson(),
    "marketing_tag": marketingTag,
  };
}

class LimitFree {
  bool? inFree;

  LimitFree({
    this.inFree,
  });

  factory LimitFree.fromJson(Map<String, dynamic> json) => LimitFree(
    inFree: json["in_free"],
  );

  Map<String, dynamic> toJson() => {
    "in_free": inFree,
  };
}

class FeedCommentConfig {
  String? inputConfigText;

  FeedCommentConfig({
    this.inputConfigText,
  });

  factory FeedCommentConfig.fromJson(Map<String, dynamic> json) => FeedCommentConfig(
    inputConfigText: json["input_config_text"],
  );

  Map<String, dynamic> toJson() => {
    "input_config_text": inputConfigText,
  };
}

class ImpressionData {
  List<dynamic>? groupIdListA;
  List<dynamic>? groupIdListB;
  List<dynamic>? groupIdListC;
  dynamic similarIdListA;
  dynamic similarIdListB;

  ImpressionData({
    this.groupIdListA,
    this.groupIdListB,
    this.groupIdListC,
    this.similarIdListA,
    this.similarIdListB,
  });

  factory ImpressionData.fromJson(Map<String, dynamic> json) => ImpressionData(
    groupIdListA: json["group_id_list_a"] == null ? [] : List<dynamic>.from(json["group_id_list_a"]!.map((x) => x)),
    groupIdListB: json["group_id_list_b"] == null ? [] : List<dynamic>.from(json["group_id_list_b"]!.map((x) => x)),
    groupIdListC: json["group_id_list_c"] == null ? [] : List<dynamic>.from(json["group_id_list_c"]!.map((x) => x)),
    similarIdListA: json["similar_id_list_a"],
    similarIdListB: json["similar_id_list_b"],
  );

  Map<String, dynamic> toJson() => {
    "group_id_list_a": groupIdListA == null ? [] : List<dynamic>.from(groupIdListA!.map((x) => x)),
    "group_id_list_b": groupIdListB == null ? [] : List<dynamic>.from(groupIdListB!.map((x) => x)),
    "group_id_list_c": groupIdListC == null ? [] : List<dynamic>.from(groupIdListC!.map((x) => x)),
    "similar_id_list_a": similarIdListA,
    "similar_id_list_b": similarIdListB,
  };
}

class MixInfo {
  AvatarThumb? coverUrl;
  String? desc;
  String? extra;
  String? mixId;
  String? mixName;
  dynamic paidEpisodes;
  AuthorShareInfo? shareInfo;
  Statis? statis;
  MixInfoStatus? status;

  MixInfo({
    this.coverUrl,
    this.desc,
    this.extra,
    this.mixId,
    this.mixName,
    this.paidEpisodes,
    this.shareInfo,
    this.statis,
    this.status,
  });

  factory MixInfo.fromJson(Map<String, dynamic> json) => MixInfo(
    coverUrl: json["cover_url"] == null ? null : AvatarThumb.fromJson(json["cover_url"]),
    desc: json["desc"],
    extra: json["extra"],
    mixId: json["mix_id"],
    mixName: json["mix_name"],
    paidEpisodes: json["paid_episodes"],
    shareInfo: json["share_info"] == null ? null : AuthorShareInfo.fromJson(json["share_info"]),
    statis: json["statis"] == null ? null : Statis.fromJson(json["statis"]),
    status: json["status"] == null ? null : MixInfoStatus.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "cover_url": coverUrl?.toJson(),
    "desc": desc,
    "extra": extra,
    "mix_id": mixId,
    "mix_name": mixName,
    "paid_episodes": paidEpisodes,
    "share_info": shareInfo?.toJson(),
    "statis": statis?.toJson(),
    "status": status?.toJson(),
  };
}

class Statis {
  int? collectVv;
  int? currentEpisode;
  int? playVv;
  int? updatedToEpisode;

  Statis({
    this.collectVv,
    this.currentEpisode,
    this.playVv,
    this.updatedToEpisode,
  });

  factory Statis.fromJson(Map<String, dynamic> json) => Statis(
    collectVv: json["collect_vv"],
    currentEpisode: json["current_episode"],
    playVv: json["play_vv"],
    updatedToEpisode: json["updated_to_episode"],
  );

  Map<String, dynamic> toJson() => {
    "collect_vv": collectVv,
    "current_episode": currentEpisode,
    "play_vv": playVv,
    "updated_to_episode": updatedToEpisode,
  };
}

class MixInfoStatus {
  int? isCollected;
  int? status;

  MixInfoStatus({
    this.isCollected,
    this.status,
  });

  factory MixInfoStatus.fromJson(Map<String, dynamic> json) => MixInfoStatus(
    isCollected: json["is_collected"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "is_collected": isCollected,
    "status": status,
  };
}

class Music {
  String? album;
  dynamic artistUserInfos;
  int? auditionDuration;
  String? author;
  bool? authorDeleted;
  dynamic authorPosition;
  AvatarThumb? avatarLarge;
  AvatarThumb? avatarMedium;
  AvatarThumb? avatarThumb;
  int? bindedChallengeId;
  int? collectStat;
  AvatarThumb? coverHd;
  AvatarThumb? coverLarge;
  AvatarThumb? coverMedium;
  AvatarThumb? coverThumb;
  int? duration;
  int? endTime;
  List<dynamic>? externalSongInfo;
  String? extra;
  double? id;
  String? idStr;
  bool? isAuthorArtist;
  bool? isDelVideo;
  bool? isOriginal;
  bool? isPgc;
  bool? isRestricted;
  bool? isVideoSelfSee;
  String? mid;
  bool? muteShare;
  String? offlineDesc;
  String? ownerHandle;
  String? ownerId;
  String? ownerNickname;
  AvatarThumb? playUrl;
  dynamic position;
  bool? preventDownload;
  int? preventItemDownloadStatus;
  int? previewEndTime;
  int? previewStartTime;
  bool? redirect;
  String? schemaUrl;
  String? secUid;
  int? shootDuration;
  int? sourcePlatform;
  int? startTime;
  int? status;
  String? title;
  dynamic unshelveCountries;
  int? userCount;
  int? videoDuration;

  Music({
    this.album,
    this.artistUserInfos,
    this.auditionDuration,
    this.author,
    this.authorDeleted,
    this.authorPosition,
    this.avatarLarge,
    this.avatarMedium,
    this.avatarThumb,
    this.bindedChallengeId,
    this.collectStat,
    this.coverHd,
    this.coverLarge,
    this.coverMedium,
    this.coverThumb,
    this.duration,
    this.endTime,
    this.externalSongInfo,
    this.extra,
    this.id,
    this.idStr,
    this.isAuthorArtist,
    this.isDelVideo,
    this.isOriginal,
    this.isPgc,
    this.isRestricted,
    this.isVideoSelfSee,
    this.mid,
    this.muteShare,
    this.offlineDesc,
    this.ownerHandle,
    this.ownerId,
    this.ownerNickname,
    this.playUrl,
    this.position,
    this.preventDownload,
    this.preventItemDownloadStatus,
    this.previewEndTime,
    this.previewStartTime,
    this.redirect,
    this.schemaUrl,
    this.secUid,
    this.shootDuration,
    this.sourcePlatform,
    this.startTime,
    this.status,
    this.title,
    this.unshelveCountries,
    this.userCount,
    this.videoDuration,
  });

  factory Music.fromJson(Map<String, dynamic> json) => Music(
    album: json["album"],
    artistUserInfos: json["artist_user_infos"],
    auditionDuration: json["audition_duration"],
    author: json["author"],
    authorDeleted: json["author_deleted"],
    authorPosition: json["author_position"],
    avatarLarge: json["avatar_large"] == null ? null : AvatarThumb.fromJson(json["avatar_large"]),
    avatarMedium: json["avatar_medium"] == null ? null : AvatarThumb.fromJson(json["avatar_medium"]),
    avatarThumb: json["avatar_thumb"] == null ? null : AvatarThumb.fromJson(json["avatar_thumb"]),
    bindedChallengeId: json["binded_challenge_id"],
    collectStat: json["collect_stat"],
    coverHd: json["cover_hd"] == null ? null : AvatarThumb.fromJson(json["cover_hd"]),
    coverLarge: json["cover_large"] == null ? null : AvatarThumb.fromJson(json["cover_large"]),
    coverMedium: json["cover_medium"] == null ? null : AvatarThumb.fromJson(json["cover_medium"]),
    coverThumb: json["cover_thumb"] == null ? null : AvatarThumb.fromJson(json["cover_thumb"]),
    duration: json["duration"],
    endTime: json["end_time"],
    externalSongInfo: json["external_song_info"] == null ? [] : List<dynamic>.from(json["external_song_info"]!.map((x) => x)),
    extra: json["extra"],
    id: json["id"]?.toDouble(),
    idStr: json["id_str"],
    isAuthorArtist: json["is_author_artist"],
    isDelVideo: json["is_del_video"],
    isOriginal: json["is_original"],
    isPgc: json["is_pgc"],
    isRestricted: json["is_restricted"],
    isVideoSelfSee: json["is_video_self_see"],
    mid: json["mid"],
    muteShare: json["mute_share"],
    offlineDesc: json["offline_desc"],
    ownerHandle: json["owner_handle"],
    ownerId: json["owner_id"],
    ownerNickname: json["owner_nickname"],
    playUrl: json["play_url"] == null ? null : AvatarThumb.fromJson(json["play_url"]),
    position: json["position"],
    preventDownload: json["prevent_download"],
    preventItemDownloadStatus: json["prevent_item_download_status"],
    previewEndTime: json["preview_end_time"],
    previewStartTime: json["preview_start_time"],
    redirect: json["redirect"],
    schemaUrl: json["schema_url"],
    secUid: json["sec_uid"],
    shootDuration: json["shoot_duration"],
    sourcePlatform: json["source_platform"],
    startTime: json["start_time"],
    status: json["status"],
    title: json["title"],
    unshelveCountries: json["unshelve_countries"],
    userCount: json["user_count"],
    videoDuration: json["video_duration"],
  );

  Map<String, dynamic> toJson() => {
    "album": album,
    "artist_user_infos": artistUserInfos,
    "audition_duration": auditionDuration,
    "author": author,
    "author_deleted": authorDeleted,
    "author_position": authorPosition,
    "avatar_large": avatarLarge?.toJson(),
    "avatar_medium": avatarMedium?.toJson(),
    "avatar_thumb": avatarThumb?.toJson(),
    "binded_challenge_id": bindedChallengeId,
    "collect_stat": collectStat,
    "cover_hd": coverHd?.toJson(),
    "cover_large": coverLarge?.toJson(),
    "cover_medium": coverMedium?.toJson(),
    "cover_thumb": coverThumb?.toJson(),
    "duration": duration,
    "end_time": endTime,
    "external_song_info": externalSongInfo == null ? [] : List<dynamic>.from(externalSongInfo!.map((x) => x)),
    "extra": extra,
    "id": id,
    "id_str": idStr,
    "is_author_artist": isAuthorArtist,
    "is_del_video": isDelVideo,
    "is_original": isOriginal,
    "is_pgc": isPgc,
    "is_restricted": isRestricted,
    "is_video_self_see": isVideoSelfSee,
    "mid": mid,
    "mute_share": muteShare,
    "offline_desc": offlineDesc,
    "owner_handle": ownerHandle,
    "owner_id": ownerId,
    "owner_nickname": ownerNickname,
    "play_url": playUrl?.toJson(),
    "position": position,
    "prevent_download": preventDownload,
    "prevent_item_download_status": preventItemDownloadStatus,
    "preview_end_time": previewEndTime,
    "preview_start_time": previewStartTime,
    "redirect": redirect,
    "schema_url": schemaUrl,
    "sec_uid": secUid,
    "shoot_duration": shootDuration,
    "source_platform": sourcePlatform,
    "start_time": startTime,
    "status": status,
    "title": title,
    "unshelve_countries": unshelveCountries,
    "user_count": userCount,
    "video_duration": videoDuration,
  };
}

class PhotoSearchEntrance {
  int? ecomType;

  PhotoSearchEntrance({
    this.ecomType,
  });

  factory PhotoSearchEntrance.fromJson(Map<String, dynamic> json) => PhotoSearchEntrance(
    ecomType: json["ecom_type"],
  );

  Map<String, dynamic> toJson() => {
    "ecom_type": ecomType,
  };
}

class RiskInfos {
  String? content;
  bool? riskSink;
  int? type;
  bool? vote;
  bool? warn;

  RiskInfos({
    this.content,
    this.riskSink,
    this.type,
    this.vote,
    this.warn,
  });

  factory RiskInfos.fromJson(Map<String, dynamic> json) => RiskInfos(
    content: json["content"],
    riskSink: json["risk_sink"],
    type: json["type"],
    vote: json["vote"],
    warn: json["warn"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "risk_sink": riskSink,
    "type": type,
    "vote": vote,
    "warn": warn,
  };
}

class AwemeListShareInfo {
  String? shareLinkDesc;
  String? shareUrl;

  AwemeListShareInfo({
    this.shareLinkDesc,
    this.shareUrl,
  });

  factory AwemeListShareInfo.fromJson(Map<String, dynamic> json) => AwemeListShareInfo(
    shareLinkDesc: json["share_link_desc"],
    shareUrl: json["share_url"],
  );

  Map<String, dynamic> toJson() => {
    "share_link_desc": shareLinkDesc,
    "share_url": shareUrl,
  };
}

class Statistics {
  int? collectCount;
  int? commentCount;
  int? diggCount;
  int? downloadCount;
  int? forwardCount;
  int? playCount;
  int? shareCount;

  Statistics({
    this.collectCount,
    this.commentCount,
    this.diggCount,
    this.downloadCount,
    this.forwardCount,
    this.playCount,
    this.shareCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    collectCount: json["collect_count"],
    commentCount: json["comment_count"],
    diggCount: json["digg_count"],
    downloadCount: json["download_count"],
    forwardCount: json["forward_count"],
    playCount: json["play_count"],
    shareCount: json["share_count"],
  );

  Map<String, dynamic> toJson() => {
    "collect_count": collectCount,
    "comment_count": commentCount,
    "digg_count": diggCount,
    "download_count": downloadCount,
    "forward_count": forwardCount,
    "play_count": playCount,
    "share_count": shareCount,
  };
}

class AwemeListStatus {
  bool? allowShare;
  bool? inReviewing;
  bool? isDelete;
  bool? isProhibited;
  int? partSee;
  int? privateStatus;

  AwemeListStatus({
    this.allowShare,
    this.inReviewing,
    this.isDelete,
    this.isProhibited,
    this.partSee,
    this.privateStatus,
  });

  factory AwemeListStatus.fromJson(Map<String, dynamic> json) => AwemeListStatus(
    allowShare: json["allow_share"],
    inReviewing: json["in_reviewing"],
    isDelete: json["is_delete"],
    isProhibited: json["is_prohibited"],
    partSee: json["part_see"],
    privateStatus: json["private_status"],
  );

  Map<String, dynamic> toJson() => {
    "allow_share": allowShare,
    "in_reviewing": inReviewing,
    "is_delete": isDelete,
    "is_prohibited": isProhibited,
    "part_see": partSee,
    "private_status": privateStatus,
  };
}

class SuggestWords {
  List<SuggestWord>? suggestWords;

  SuggestWords({
    this.suggestWords,
  });

  factory SuggestWords.fromJson(Map<String, dynamic> json) => SuggestWords(
    suggestWords: json["suggest_words"] == null ? [] : List<SuggestWord>.from(json["suggest_words"]!.map((x) => SuggestWord.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "suggest_words": suggestWords == null ? [] : List<dynamic>.from(suggestWords!.map((x) => x.toJson())),
  };
}

class SuggestWord {
  String? hintText;
  String? iconUrl;
  String? scene;
  List<Word>? words;

  SuggestWord({
    this.hintText,
    this.iconUrl,
    this.scene,
    this.words,
  });

  factory SuggestWord.fromJson(Map<String, dynamic> json) => SuggestWord(
    hintText: json["hint_text"],
    iconUrl: json["icon_url"],
    scene: json["scene"],
    words: json["words"] == null ? [] : List<Word>.from(json["words"]!.map((x) => Word.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hint_text": hintText,
    "icon_url": iconUrl,
    "scene": scene,
    "words": words == null ? [] : List<dynamic>.from(words!.map((x) => x.toJson())),
  };
}

class Word {
  String? info;
  String? word;
  String? wordId;

  Word({
    this.info,
    this.word,
    this.wordId,
  });

  factory Word.fromJson(Map<String, dynamic> json) => Word(
    info: json["info"],
    word: json["word"],
    wordId: json["word_id"],
  );

  Map<String, dynamic> toJson() => {
    "info": info,
    "word": word,
    "word_id": wordId,
  };
}

class TextExtra {
  int? captionEnd;
  int? captionStart;
  int? end;
  String? hashtagId;
  String? hashtagName;
  bool? isCommerce;
  int? start;
  int? type;

  TextExtra({
    this.captionEnd,
    this.captionStart,
    this.end,
    this.hashtagId,
    this.hashtagName,
    this.isCommerce,
    this.start,
    this.type,
  });

  factory TextExtra.fromJson(Map<String, dynamic> json) => TextExtra(
    captionEnd: json["caption_end"],
    captionStart: json["caption_start"],
    end: json["end"],
    hashtagId: json["hashtag_id"],
    hashtagName: json["hashtag_name"],
    isCommerce: json["is_commerce"],
    start: json["start"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "caption_end": captionEnd,
    "caption_start": captionStart,
    "end": end,
    "hashtag_id": hashtagId,
    "hashtag_name": hashtagName,
    "is_commerce": isCommerce,
    "start": start,
    "type": type,
  };
}

class Video {
  List<BigThumb>? bigThumbs;
  List<BitRate>? bitRate;
  List<BitRateAudio>? bitRateAudio;
  AvatarThumb? cover;
  int? duration;
  AvatarThumb? dynamicCover;
  AvatarThumb? gaussianCover;
  int? height;
  int? isLongVideo;
  String? meta;
  AvatarThumb? originCover;
  PlayAddr? playAddr;
  PlayAddr? playAddr265;
  PlayAddr? playAddrH264;
  String? ratio;
  String? videoModel;
  int? width;

  Video({
    this.bigThumbs,
    this.bitRate,
    this.bitRateAudio,
    this.cover,
    this.duration,
    this.dynamicCover,
    this.gaussianCover,
    this.height,
    this.isLongVideo,
    this.meta,
    this.originCover,
    this.playAddr,
    this.playAddr265,
    this.playAddrH264,
    this.ratio,
    this.videoModel,
    this.width,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    bigThumbs: json["big_thumbs"] == null ? [] : List<BigThumb>.from(json["big_thumbs"]!.map((x) => BigThumb.fromJson(x))),
    bitRate: json["bit_rate"] == null ? [] : List<BitRate>.from(json["bit_rate"]!.map((x) => BitRate.fromJson(x))),
    bitRateAudio: json["bit_rate_audio"] == null ? [] : List<BitRateAudio>.from(json["bit_rate_audio"]!.map((x) => BitRateAudio.fromJson(x))),
    cover: json["cover"] == null ? null : AvatarThumb.fromJson(json["cover"]),
    duration: json["duration"],
    dynamicCover: json["dynamic_cover"] == null ? null : AvatarThumb.fromJson(json["dynamic_cover"]),
    gaussianCover: json["gaussian_cover"] == null ? null : AvatarThumb.fromJson(json["gaussian_cover"]),
    height: json["height"],
    isLongVideo: json["is_long_video"],
    meta: json["meta"],
    originCover: json["origin_cover"] == null ? null : AvatarThumb.fromJson(json["origin_cover"]),
    playAddr: json["play_addr"] == null ? null : PlayAddr.fromJson(json["play_addr"]),
    playAddr265: json["play_addr_265"] == null ? null : PlayAddr.fromJson(json["play_addr_265"]),
    playAddrH264: json["play_addr_h264"] == null ? null : PlayAddr.fromJson(json["play_addr_h264"]),
    ratio: json["ratio"],
    videoModel: json["video_model"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "big_thumbs": bigThumbs == null ? [] : List<dynamic>.from(bigThumbs!.map((x) => x.toJson())),
    "bit_rate": bitRate == null ? [] : List<dynamic>.from(bitRate!.map((x) => x.toJson())),
    "bit_rate_audio": bitRateAudio == null ? [] : List<dynamic>.from(bitRateAudio!.map((x) => x.toJson())),
    "cover": cover?.toJson(),
    "duration": duration,
    "dynamic_cover": dynamicCover?.toJson(),
    "gaussian_cover": gaussianCover?.toJson(),
    "height": height,
    "is_long_video": isLongVideo,
    "meta": meta,
    "origin_cover": originCover?.toJson(),
    "play_addr": playAddr?.toJson(),
    "play_addr_265": playAddr265?.toJson(),
    "play_addr_h264": playAddrH264?.toJson(),
    "ratio": ratio,
    "video_model": videoModel,
    "width": width,
  };
}

class BigThumb {
  double? duration;
  String? fext;
  int? imgNum;
  String? imgUrl;
  List<String>? imgUrls;
  int? imgXLen;
  int? imgXSize;
  int? imgYLen;
  int? imgYSize;
  double? interval;
  String? uri;
  List<String>? uris;

  BigThumb({
    this.duration,
    this.fext,
    this.imgNum,
    this.imgUrl,
    this.imgUrls,
    this.imgXLen,
    this.imgXSize,
    this.imgYLen,
    this.imgYSize,
    this.interval,
    this.uri,
    this.uris,
  });

  factory BigThumb.fromJson(Map<String, dynamic> json) => BigThumb(
    duration: json["duration"]?.toDouble(),
    fext: json["fext"],
    imgNum: json["img_num"],
    imgUrl: json["img_url"],
    imgUrls: json["img_urls"] == null ? [] : List<String>.from(json["img_urls"]!.map((x) => x)),
    imgXLen: json["img_x_len"],
    imgXSize: json["img_x_size"],
    imgYLen: json["img_y_len"],
    imgYSize: json["img_y_size"],
    interval: json["interval"]?.toDouble(),
    uri: json["uri"],
    uris: json["uris"] == null ? [] : List<String>.from(json["uris"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "duration": duration,
    "fext": fext,
    "img_num": imgNum,
    "img_url": imgUrl,
    "img_urls": imgUrls == null ? [] : List<dynamic>.from(imgUrls!.map((x) => x)),
    "img_x_len": imgXLen,
    "img_x_size": imgXSize,
    "img_y_len": imgYLen,
    "img_y_size": imgYSize,
    "interval": interval,
    "uri": uri,
    "uris": uris == null ? [] : List<dynamic>.from(uris!.map((x) => x)),
  };
}

class BitRate {
  int? fps;
  String? hdrBit;
  String? hdrType;
  int? bitRate;
  Format? format;
  String? gearName;
  int? isH265;
  PlayAddr? playAddr;
  int? qualityType;
  String? videoExtra;

  BitRate({
    this.fps,
    this.hdrBit,
    this.hdrType,
    this.bitRate,
    this.format,
    this.gearName,
    this.isH265,
    this.playAddr,
    this.qualityType,
    this.videoExtra,
  });

  factory BitRate.fromJson(Map<String, dynamic> json) => BitRate(
    fps: json["FPS"],
    hdrBit: json["HDR_bit"],
    hdrType: json["HDR_type"],
    bitRate: json["bit_rate"],
    format: formatValues.map[json["format"]]!,
    gearName: json["gear_name"],
    isH265: json["is_h265"],
    playAddr: json["play_addr"] == null ? null : PlayAddr.fromJson(json["play_addr"]),
    qualityType: json["quality_type"],
    videoExtra: json["video_extra"],
  );

  Map<String, dynamic> toJson() => {
    "FPS": fps,
    "HDR_bit": hdrBit,
    "HDR_type": hdrType,
    "bit_rate": bitRate,
    "format": formatValues.reverse[format],
    "gear_name": gearName,
    "is_h265": isH265,
    "play_addr": playAddr?.toJson(),
    "quality_type": qualityType,
    "video_extra": videoExtra,
  };
}

enum Format {
  DASH,
  MP4
}

final formatValues = EnumValues({
  "dash": Format.DASH,
  "mp4": Format.MP4
});

class PlayAddr {
  int? dataSize;
  String? fileCs;
  String? fileHash;
  int? height;
  Uri? uri;
  String? urlKey;
  List<String>? urlList;
  int? width;

  PlayAddr({
    this.dataSize,
    this.fileCs,
    this.fileHash,
    this.height,
    this.uri,
    this.urlKey,
    this.urlList,
    this.width,
  });

  factory PlayAddr.fromJson(Map<String, dynamic> json) => PlayAddr(
    dataSize: json["data_size"],
    fileCs: json["file_cs"],
    fileHash: json["file_hash"],
    height: json["height"],
    urlKey: json["url_key"],
    urlList: json["url_list"] == null ? [] : List<String>.from(json["url_list"]!.map((x) => x)),
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "data_size": dataSize,
    "file_cs": fileCs,
    "file_hash": fileHash,
    "height": height,
    "uri": uriValues.reverse[uri],
    "url_key": urlKey,
    "url_list": urlList == null ? [] : List<dynamic>.from(urlList!.map((x) => x)),
    "width": width,
  };
}

enum Uri {
  V0_D00_FG10000_CULFBO7_OG65_VFQ7_GEMDG
}

final uriValues = EnumValues({
  "v0d00fg10000culfbo7og65vfq7gemdg": Uri.V0_D00_FG10000_CULFBO7_OG65_VFQ7_GEMDG
});

class BitRateAudio {
  String? audioExtra;
  AudioMeta? audioMeta;
  int? audioQuality;

  BitRateAudio({
    this.audioExtra,
    this.audioMeta,
    this.audioQuality,
  });

  factory BitRateAudio.fromJson(Map<String, dynamic> json) => BitRateAudio(
    audioExtra: json["audio_extra"],
    audioMeta: json["audio_meta"] == null ? null : AudioMeta.fromJson(json["audio_meta"]),
    audioQuality: json["audio_quality"],
  );

  Map<String, dynamic> toJson() => {
    "audio_extra": audioExtra,
    "audio_meta": audioMeta?.toJson(),
    "audio_quality": audioQuality,
  };
}

class AudioMeta {
  int? bitrate;
  String? codecType;
  String? encodedType;
  String? fileHash;
  String? fileId;
  Format? format;
  int? fps;
  String? logoType;
  String? mediaType;
  String? quality;
  String? qualityDesc;
  int? size;
  String? subInfo;
  UrlList? urlList;

  AudioMeta({
    this.bitrate,
    this.codecType,
    this.encodedType,
    this.fileHash,
    this.fileId,
    this.format,
    this.fps,
    this.logoType,
    this.mediaType,
    this.quality,
    this.qualityDesc,
    this.size,
    this.subInfo,
    this.urlList,
  });

  factory AudioMeta.fromJson(Map<String, dynamic> json) => AudioMeta(
    bitrate: json["bitrate"],
    codecType: json["codec_type"],
    encodedType: json["encoded_type"],
    fileHash: json["file_hash"],
    fileId: json["file_id"],
    format: formatValues.map[json["format"]]!,
    fps: json["fps"],
    logoType: json["logo_type"],
    mediaType: json["media_type"],
    quality: json["quality"],
    qualityDesc: json["quality_desc"],
    size: json["size"],
    subInfo: json["sub_info"],
    urlList: json["url_list"] == null ? null : UrlList.fromJson(json["url_list"]),
  );

  Map<String, dynamic> toJson() => {
    "bitrate": bitrate,
    "codec_type": codecType,
    "encoded_type": encodedType,
    "file_hash": fileHash,
    "file_id": fileId,
    "format": formatValues.reverse[format],
    "fps": fps,
    "logo_type": logoType,
    "media_type": mediaType,
    "quality": quality,
    "quality_desc": qualityDesc,
    "size": size,
    "sub_info": subInfo,
    "url_list": urlList?.toJson(),
  };
}

class UrlList {
  String? backupUrl;
  String? fallbackUrl;
  String? mainUrl;

  UrlList({
    this.backupUrl,
    this.fallbackUrl,
    this.mainUrl,
  });

  factory UrlList.fromJson(Map<String, dynamic> json) => UrlList(
    backupUrl: json["backup_url"],
    fallbackUrl: json["fallback_url"],
    mainUrl: json["main_url"],
  );

  Map<String, dynamic> toJson() => {
    "backup_url": backupUrl,
    "fallback_url": fallbackUrl,
    "main_url": mainUrl,
  };
}

class VideoControl {
  bool? allowDouplus;
  bool? allowDownload;
  bool? allowDuet;
  bool? allowDynamicWallpaper;
  bool? allowMusic;
  bool? allowReact;
  DownloadInfo? downloadInfo;
  int? draftProgressBar;
  DuetInfo? duetInfo;
  int? preventDownloadType;
  int? shareType;
  int? showProgressBar;
  int? timerStatus;

  VideoControl({
    this.allowDouplus,
    this.allowDownload,
    this.allowDuet,
    this.allowDynamicWallpaper,
    this.allowMusic,
    this.allowReact,
    this.downloadInfo,
    this.draftProgressBar,
    this.duetInfo,
    this.preventDownloadType,
    this.shareType,
    this.showProgressBar,
    this.timerStatus,
  });

  factory VideoControl.fromJson(Map<String, dynamic> json) => VideoControl(
    allowDouplus: json["allow_douplus"],
    allowDownload: json["allow_download"],
    allowDuet: json["allow_duet"],
    allowDynamicWallpaper: json["allow_dynamic_wallpaper"],
    allowMusic: json["allow_music"],
    allowReact: json["allow_react"],
    downloadInfo: json["download_info"] == null ? null : DownloadInfo.fromJson(json["download_info"]),
    draftProgressBar: json["draft_progress_bar"],
    duetInfo: json["duet_info"] == null ? null : DuetInfo.fromJson(json["duet_info"]),
    preventDownloadType: json["prevent_download_type"],
    shareType: json["share_type"],
    showProgressBar: json["show_progress_bar"],
    timerStatus: json["timer_status"],
  );

  Map<String, dynamic> toJson() => {
    "allow_douplus": allowDouplus,
    "allow_download": allowDownload,
    "allow_duet": allowDuet,
    "allow_dynamic_wallpaper": allowDynamicWallpaper,
    "allow_music": allowMusic,
    "allow_react": allowReact,
    "download_info": downloadInfo?.toJson(),
    "draft_progress_bar": draftProgressBar,
    "duet_info": duetInfo?.toJson(),
    "prevent_download_type": preventDownloadType,
    "share_type": shareType,
    "show_progress_bar": showProgressBar,
    "timer_status": timerStatus,
  };
}

class DownloadInfo {
  DownloadInfoFailInfo? failInfo;
  int? level;

  DownloadInfo({
    this.failInfo,
    this.level,
  });

  factory DownloadInfo.fromJson(Map<String, dynamic> json) => DownloadInfo(
    failInfo: json["fail_info"] == null ? null : DownloadInfoFailInfo.fromJson(json["fail_info"]),
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "fail_info": failInfo?.toJson(),
    "level": level,
  };
}

class DownloadInfoFailInfo {
  int? code;
  String? msg;
  String? reason;

  DownloadInfoFailInfo({
    this.code,
    this.msg,
    this.reason,
  });

  factory DownloadInfoFailInfo.fromJson(Map<String, dynamic> json) => DownloadInfoFailInfo(
    code: json["code"],
    msg: json["msg"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
    "reason": reason,
  };
}

class DuetInfo {
  DuetInfoFailInfo? failInfo;
  int? level;

  DuetInfo({
    this.failInfo,
    this.level,
  });

  factory DuetInfo.fromJson(Map<String, dynamic> json) => DuetInfo(
    failInfo: json["fail_info"] == null ? null : DuetInfoFailInfo.fromJson(json["fail_info"]),
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "fail_info": failInfo?.toJson(),
    "level": level,
  };
}

class DuetInfoFailInfo {
  int? code;
  String? reason;

  DuetInfoFailInfo({
    this.code,
    this.reason,
  });

  factory DuetInfoFailInfo.fromJson(Map<String, dynamic> json) => DuetInfoFailInfo(
    code: json["code"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "reason": reason,
  };
}

class VideoTag {
  int? level;
  int? tagId;
  String? tagName;

  VideoTag({
    this.level,
    this.tagId,
    this.tagName,
  });

  factory VideoTag.fromJson(Map<String, dynamic> json) => VideoTag(
    level: json["level"],
    tagId: json["tag_id"],
    tagName: json["tag_name"],
  );

  Map<String, dynamic> toJson() => {
    "level": level,
    "tag_id": tagId,
    "tag_name": tagName,
  };
}

class VisualSearchInfo {
  String? extra;
  bool? isShowEntrance;

  VisualSearchInfo({
    this.extra,
    this.isShowEntrance,
  });

  factory VisualSearchInfo.fromJson(Map<String, dynamic> json) => VisualSearchInfo(
    extra: json["extra"],
    isShowEntrance: json["is_show_entrance"],
  );

  Map<String, dynamic> toJson() => {
    "extra": extra,
    "is_show_entrance": isShowEntrance,
  };
}

class LogPb {
  String? imprId;

  LogPb({
    this.imprId,
  });

  factory LogPb.fromJson(Map<String, dynamic> json) => LogPb(
    imprId: json["impr_id"],
  );

  Map<String, dynamic> toJson() => {
    "impr_id": imprId,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
