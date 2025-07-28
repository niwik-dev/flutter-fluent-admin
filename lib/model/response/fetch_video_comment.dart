// To parse this JSON data, do
//
//     final fetchVideoComments = fetchVideoCommentsFromJson(jsonString);

import 'dart:convert';

FetchVideoCommentsResponse fetchVideoCommentsFromJson(String str) => FetchVideoCommentsResponse.fromJson(json.decode(str));

String fetchVideoCommentsToJson(FetchVideoCommentsResponse data) => json.encode(data.toJson());

class FetchVideoCommentsResponse {
  int? statusCode;
  List<Comment>? comments;
  int? cursor;
  int? hasMore;
  int? replyStyle;
  int? total;
  Extra? extra;
  LogPb? logPb;
  int? hotsoonFilteredCount;
  int? userCommented;
  FastResponseComment? fastResponseComment;
  CommentConfig? commentConfig;
  CommentConfig? generalCommentConfig;
  int? showManagementEntryPoint;
  String? commentCommonData;
  int? foldedCommentCount;

  FetchVideoCommentsResponse({
    this.statusCode,
    this.comments,
    this.cursor,
    this.hasMore,
    this.replyStyle,
    this.total,
    this.extra,
    this.logPb,
    this.hotsoonFilteredCount,
    this.userCommented,
    this.fastResponseComment,
    this.commentConfig,
    this.generalCommentConfig,
    this.showManagementEntryPoint,
    this.commentCommonData,
    this.foldedCommentCount,
  });

  factory FetchVideoCommentsResponse.fromJson(Map<String, dynamic> json) => FetchVideoCommentsResponse(
    statusCode: json["status_code"],
    comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
    cursor: json["cursor"],
    hasMore: json["has_more"],
    replyStyle: json["reply_style"],
    total: json["total"],
    extra: json["extra"] == null ? null : Extra.fromJson(json["extra"]),
    logPb: json["log_pb"] == null ? null : LogPb.fromJson(json["log_pb"]),
    hotsoonFilteredCount: json["hotsoon_filtered_count"],
    userCommented: json["user_commented"],
    fastResponseComment: json["fast_response_comment"] == null ? null : FastResponseComment.fromJson(json["fast_response_comment"]),
    commentConfig: json["comment_config"] == null ? null : CommentConfig.fromJson(json["comment_config"]),
    generalCommentConfig: json["general_comment_config"] == null ? null : CommentConfig.fromJson(json["general_comment_config"]),
    showManagementEntryPoint: json["show_management_entry_point"],
    commentCommonData: json["comment_common_data"],
    foldedCommentCount: json["folded_comment_count"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
    "cursor": cursor,
    "has_more": hasMore,
    "reply_style": replyStyle,
    "total": total,
    "extra": extra?.toJson(),
    "log_pb": logPb?.toJson(),
    "hotsoon_filtered_count": hotsoonFilteredCount,
    "user_commented": userCommented,
    "fast_response_comment": fastResponseComment?.toJson(),
    "comment_config": commentConfig?.toJson(),
    "general_comment_config": generalCommentConfig?.toJson(),
    "show_management_entry_point": showManagementEntryPoint,
    "comment_common_data": commentCommonData,
    "folded_comment_count": foldedCommentCount,
  };
}

class CommentConfig {
  CommentConfig();

  factory CommentConfig.fromJson(Map<String, dynamic> json) => CommentConfig(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Comment {
  String? cid;
  String? text;
  String? awemeId;
  int? createTime;
  int? diggCount;
  int? status;
  User? user;
  String? replyId;
  int? userDigged;
  dynamic replyComment;
  List<dynamic>? textExtra;
  String? labelText;
  int? labelType;
  int? replyCommentTotal;
  String? replyToReplyId;
  bool? isAuthorDigged;
  int? stickPosition;
  bool? userBuried;
  dynamic labelList;
  bool? isHot;
  dynamic textMusicInfo;
  dynamic imageList;
  int? isNoteComment;
  String? ipLabel;
  bool? canShare;
  int? itemCommentTotal;
  int? level;
  dynamic videoList;
  String? sortTags;
  bool? isUserTendToReply;
  int? contentType;
  bool? isFolded;
  String? enterFrom;
  Sticker? sticker;

  Comment({
    this.cid,
    this.text,
    this.awemeId,
    this.createTime,
    this.diggCount,
    this.status,
    this.user,
    this.replyId,
    this.userDigged,
    this.replyComment,
    this.textExtra,
    this.labelText,
    this.labelType,
    this.replyCommentTotal,
    this.replyToReplyId,
    this.isAuthorDigged,
    this.stickPosition,
    this.userBuried,
    this.labelList,
    this.isHot,
    this.textMusicInfo,
    this.imageList,
    this.isNoteComment,
    this.ipLabel,
    this.canShare,
    this.itemCommentTotal,
    this.level,
    this.videoList,
    this.sortTags,
    this.isUserTendToReply,
    this.contentType,
    this.isFolded,
    this.enterFrom,
    this.sticker,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    cid: json["cid"],
    text: json["text"],
    awemeId: json["aweme_id"],
    createTime: json["create_time"],
    diggCount: json["digg_count"],
    status: json["status"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    replyId: json["reply_id"],
    userDigged: json["user_digged"],
    replyComment: json["reply_comment"],
    textExtra: json["text_extra"] == null ? [] : List<dynamic>.from(json["text_extra"]!.map((x) => x)),
    labelText: json["label_text"],
    labelType: json["label_type"],
    replyCommentTotal: json["reply_comment_total"],
    replyToReplyId: json["reply_to_reply_id"],
    isAuthorDigged: json["is_author_digged"],
    stickPosition: json["stick_position"],
    userBuried: json["user_buried"],
    labelList: json["label_list"],
    isHot: json["is_hot"],
    textMusicInfo: json["text_music_info"],
    imageList: json["image_list"],
    isNoteComment: json["is_note_comment"],
    ipLabel: json["ip_label"],
    canShare: json["can_share"],
    itemCommentTotal: json["item_comment_total"],
    level: json["level"],
    videoList: json["video_list"],
    sortTags: json["sort_tags"],
    isUserTendToReply: json["is_user_tend_to_reply"],
    contentType: json["content_type"],
    isFolded: json["is_folded"],
    enterFrom: json["enter_from"],
    sticker: json["sticker"] == null ? null : Sticker.fromJson(json["sticker"]),
  );

  Map<String, dynamic> toJson() => {
    "cid": cid,
    "text": text,
    "aweme_id": awemeId,
    "create_time": createTime,
    "digg_count": diggCount,
    "status": status,
    "user": user?.toJson(),
    "reply_id": replyId,
    "user_digged": userDigged,
    "reply_comment": replyComment,
    "text_extra": textExtra == null ? [] : List<dynamic>.from(textExtra!.map((x) => x)),
    "label_text": labelText,
    "label_type": labelType,
    "reply_comment_total": replyCommentTotal,
    "reply_to_reply_id": replyToReplyId,
    "is_author_digged": isAuthorDigged,
    "stick_position": stickPosition,
    "user_buried": userBuried,
    "label_list": labelList,
    "is_hot": isHot,
    "text_music_info": textMusicInfo,
    "image_list": imageList,
    "is_note_comment": isNoteComment,
    "ip_label": ipLabel,
    "can_share": canShare,
    "item_comment_total": itemCommentTotal,
    "level": level,
    "video_list": videoList,
    "sort_tags": sortTags,
    "is_user_tend_to_reply": isUserTendToReply,
    "content_type": contentType,
    "is_folded": isFolded,
    "enter_from": enterFrom,
    "sticker": sticker?.toJson(),
  };
}

class Sticker {
  double? id;
  int? width;
  int? height;
  AnimateUrl? staticUrl;
  AnimateUrl? animateUrl;
  int? stickerType;
  int? originPackageId;
  String? idStr;
  String? authorSecUid;

  Sticker({
    this.id,
    this.width,
    this.height,
    this.staticUrl,
    this.animateUrl,
    this.stickerType,
    this.originPackageId,
    this.idStr,
    this.authorSecUid,
  });

  factory Sticker.fromJson(Map<String, dynamic> json) => Sticker(
    id: json["id"]?.toDouble(),
    width: json["width"],
    height: json["height"],
    staticUrl: json["static_url"] == null ? null : AnimateUrl.fromJson(json["static_url"]),
    animateUrl: json["animate_url"] == null ? null : AnimateUrl.fromJson(json["animate_url"]),
    stickerType: json["sticker_type"],
    originPackageId: json["origin_package_id"],
    idStr: json["id_str"],
    authorSecUid: json["author_sec_uid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "width": width,
    "height": height,
    "static_url": staticUrl?.toJson(),
    "animate_url": animateUrl?.toJson(),
    "sticker_type": stickerType,
    "origin_package_id": originPackageId,
    "id_str": idStr,
    "author_sec_uid": authorSecUid,
  };
}

class AnimateUrl {
  String? uri;
  List<String>? urlList;
  int? width;
  int? height;

  AnimateUrl({
    this.uri,
    this.urlList,
    this.width,
    this.height,
  });

  factory AnimateUrl.fromJson(Map<String, dynamic> json) => AnimateUrl(
    uri: json["uri"],
    urlList: json["url_list"] == null ? [] : List<String>.from(json["url_list"]!.map((x) => x)),
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "url_list": urlList == null ? [] : List<dynamic>.from(urlList!.map((x) => x)),
    "width": width,
    "height": height,
  };
}

class User {
  String? uid;
  String? shortId;
  String? nickname;
  AnimateUrl? avatarThumb;
  String? uniqueId;
  bool? isAdFake;
  dynamic followersDetail;
  Region? region;
  int? commerceUserLevel;
  dynamic platformSyncInfo;
  int? secret;
  dynamic geofencing;
  dynamic coverUrl;
  dynamic itemList;
  dynamic newStoryCover;
  dynamic typeLabel;
  dynamic adCoverUrl;
  dynamic relativeUsers;
  dynamic chaList;
  String? secUid;
  dynamic needPoints;
  dynamic homepageBottomToast;
  dynamic canSetGeofencing;
  dynamic whiteCoverUrl;
  dynamic userTags;
  List<dynamic>? banUserFunctions;
  dynamic cardEntries;
  dynamic displayInfo;
  dynamic cardEntriesNotDisplay;
  dynamic cardSortPriority;
  dynamic interestTags;
  dynamic linkItemList;
  dynamic userPermissions;
  dynamic offlineInfoList;
  dynamic signatureExtra;
  dynamic personalTagList;
  dynamic cfList;
  dynamic imRoleIds;
  dynamic notSeenItemIdList;
  dynamic followerListSecondaryInformationStruct;
  dynamic endorsementInfoList;
  dynamic textExtra;
  dynamic contrailList;
  dynamic dataLabelList;
  dynamic notSeenItemIdListV2;
  dynamic specialPeopleLabels;
  dynamic familiarVisitorUser;
  dynamic avatarSchemaList;
  dynamic profileMobParams;
  dynamic verificationPermissionIds;
  dynamic batchUnfollowRelationDesc;
  dynamic batchUnfollowContainTabs;
  dynamic creatorTagList;
  dynamic privateRelationList;

  User({
    this.uid,
    this.shortId,
    this.nickname,
    this.avatarThumb,
    this.uniqueId,
    this.isAdFake,
    this.followersDetail,
    this.region,
    this.commerceUserLevel,
    this.platformSyncInfo,
    this.secret,
    this.geofencing,
    this.coverUrl,
    this.itemList,
    this.newStoryCover,
    this.typeLabel,
    this.adCoverUrl,
    this.relativeUsers,
    this.chaList,
    this.secUid,
    this.needPoints,
    this.homepageBottomToast,
    this.canSetGeofencing,
    this.whiteCoverUrl,
    this.userTags,
    this.banUserFunctions,
    this.cardEntries,
    this.displayInfo,
    this.cardEntriesNotDisplay,
    this.cardSortPriority,
    this.interestTags,
    this.linkItemList,
    this.userPermissions,
    this.offlineInfoList,
    this.signatureExtra,
    this.personalTagList,
    this.cfList,
    this.imRoleIds,
    this.notSeenItemIdList,
    this.followerListSecondaryInformationStruct,
    this.endorsementInfoList,
    this.textExtra,
    this.contrailList,
    this.dataLabelList,
    this.notSeenItemIdListV2,
    this.specialPeopleLabels,
    this.familiarVisitorUser,
    this.avatarSchemaList,
    this.profileMobParams,
    this.verificationPermissionIds,
    this.batchUnfollowRelationDesc,
    this.batchUnfollowContainTabs,
    this.creatorTagList,
    this.privateRelationList,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    uid: json["uid"],
    shortId: json["short_id"],
    nickname: json["nickname"],
    avatarThumb: json["avatar_thumb"] == null ? null : AnimateUrl.fromJson(json["avatar_thumb"]),
    uniqueId: json["unique_id"],
    isAdFake: json["is_ad_fake"],
    followersDetail: json["followers_detail"],
    region: regionValues.map[json["region"]]!,
    commerceUserLevel: json["commerce_user_level"],
    platformSyncInfo: json["platform_sync_info"],
    secret: json["secret"],
    geofencing: json["geofencing"],
    coverUrl: json["cover_url"],
    itemList: json["item_list"],
    newStoryCover: json["new_story_cover"],
    typeLabel: json["type_label"],
    adCoverUrl: json["ad_cover_url"],
    relativeUsers: json["relative_users"],
    chaList: json["cha_list"],
    secUid: json["sec_uid"],
    needPoints: json["need_points"],
    homepageBottomToast: json["homepage_bottom_toast"],
    canSetGeofencing: json["can_set_geofencing"],
    whiteCoverUrl: json["white_cover_url"],
    userTags: json["user_tags"],
    banUserFunctions: json["ban_user_functions"] == null ? [] : List<dynamic>.from(json["ban_user_functions"]!.map((x) => x)),
    cardEntries: json["card_entries"],
    displayInfo: json["display_info"],
    cardEntriesNotDisplay: json["card_entries_not_display"],
    cardSortPriority: json["card_sort_priority"],
    interestTags: json["interest_tags"],
    linkItemList: json["link_item_list"],
    userPermissions: json["user_permissions"],
    offlineInfoList: json["offline_info_list"],
    signatureExtra: json["signature_extra"],
    personalTagList: json["personal_tag_list"],
    cfList: json["cf_list"],
    imRoleIds: json["im_role_ids"],
    notSeenItemIdList: json["not_seen_item_id_list"],
    followerListSecondaryInformationStruct: json["follower_list_secondary_information_struct"],
    endorsementInfoList: json["endorsement_info_list"],
    textExtra: json["text_extra"],
    contrailList: json["contrail_list"],
    dataLabelList: json["data_label_list"],
    notSeenItemIdListV2: json["not_seen_item_id_list_v2"],
    specialPeopleLabels: json["special_people_labels"],
    familiarVisitorUser: json["familiar_visitor_user"],
    avatarSchemaList: json["avatar_schema_list"],
    profileMobParams: json["profile_mob_params"],
    verificationPermissionIds: json["verification_permission_ids"],
    batchUnfollowRelationDesc: json["batch_unfollow_relation_desc"],
    batchUnfollowContainTabs: json["batch_unfollow_contain_tabs"],
    creatorTagList: json["creator_tag_list"],
    privateRelationList: json["private_relation_list"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "short_id": shortId,
    "nickname": nickname,
    "avatar_thumb": avatarThumb?.toJson(),
    "unique_id": uniqueId,
    "is_ad_fake": isAdFake,
    "followers_detail": followersDetail,
    "region": regionValues.reverse[region],
    "commerce_user_level": commerceUserLevel,
    "platform_sync_info": platformSyncInfo,
    "secret": secret,
    "geofencing": geofencing,
    "cover_url": coverUrl,
    "item_list": itemList,
    "new_story_cover": newStoryCover,
    "type_label": typeLabel,
    "ad_cover_url": adCoverUrl,
    "relative_users": relativeUsers,
    "cha_list": chaList,
    "sec_uid": secUid,
    "need_points": needPoints,
    "homepage_bottom_toast": homepageBottomToast,
    "can_set_geofencing": canSetGeofencing,
    "white_cover_url": whiteCoverUrl,
    "user_tags": userTags,
    "ban_user_functions": banUserFunctions == null ? [] : List<dynamic>.from(banUserFunctions!.map((x) => x)),
    "card_entries": cardEntries,
    "display_info": displayInfo,
    "card_entries_not_display": cardEntriesNotDisplay,
    "card_sort_priority": cardSortPriority,
    "interest_tags": interestTags,
    "link_item_list": linkItemList,
    "user_permissions": userPermissions,
    "offline_info_list": offlineInfoList,
    "signature_extra": signatureExtra,
    "personal_tag_list": personalTagList,
    "cf_list": cfList,
    "im_role_ids": imRoleIds,
    "not_seen_item_id_list": notSeenItemIdList,
    "follower_list_secondary_information_struct": followerListSecondaryInformationStruct,
    "endorsement_info_list": endorsementInfoList,
    "text_extra": textExtra,
    "contrail_list": contrailList,
    "data_label_list": dataLabelList,
    "not_seen_item_id_list_v2": notSeenItemIdListV2,
    "special_people_labels": specialPeopleLabels,
    "familiar_visitor_user": familiarVisitorUser,
    "avatar_schema_list": avatarSchemaList,
    "profile_mob_params": profileMobParams,
    "verification_permission_ids": verificationPermissionIds,
    "batch_unfollow_relation_desc": batchUnfollowRelationDesc,
    "batch_unfollow_contain_tabs": batchUnfollowContainTabs,
    "creator_tag_list": creatorTagList,
    "private_relation_list": privateRelationList,
  };
}

enum Region {
  CN
}

final regionValues = EnumValues({
  "CN": Region.CN
});

class Extra {
  int? now;
  dynamic fatalItemIds;

  Extra({
    this.now,
    this.fatalItemIds,
  });

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
    now: json["now"],
    fatalItemIds: json["fatal_item_ids"],
  );

  Map<String, dynamic> toJson() => {
    "now": now,
    "fatal_item_ids": fatalItemIds,
  };
}

class FastResponseComment {
  List<String>? constantResponseWords;
  List<String>? timedResponseWords;

  FastResponseComment({
    this.constantResponseWords,
    this.timedResponseWords,
  });

  factory FastResponseComment.fromJson(Map<String, dynamic> json) => FastResponseComment(
    constantResponseWords: json["constant_response_words"] == null ? [] : List<String>.from(json["constant_response_words"]!.map((x) => x)),
    timedResponseWords: json["timed_response_words"] == null ? [] : List<String>.from(json["timed_response_words"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "constant_response_words": constantResponseWords == null ? [] : List<dynamic>.from(constantResponseWords!.map((x) => x)),
    "timed_response_words": timedResponseWords == null ? [] : List<dynamic>.from(timedResponseWords!.map((x) => x)),
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
