// To parse this JSON data, do
//
//     final trendingDataModel = trendingDataModelFromMap(jsonString);
class TrendingDataModel {
  String? type;
  String? id;
  String? url;
  String? slug;
  String? bitlyGifUrl;
  String? bitlyUrl;
  String? embedUrl;
  String? username;
  String? source;
  String? title;
  String? rating;
  String? contentUrl;
  String? sourceTld;
  String? sourcePostUrl;
  int? isSticker;
  DateTime? importDatetime;
  String? trendingDatetime;
  Images? images;
  User? user;
  String? analyticsResponsePayload;
  Analytics? analytics;

  TrendingDataModel({
    this.type,
    this.id,
    this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.isSticker,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
    this.user,
    this.analyticsResponsePayload,
    this.analytics,
  });

  factory TrendingDataModel.fromMap(Map<String, dynamic> json) =>
      TrendingDataModel(
        type: json["type"],
        id: json["id"],
        url: json["url"],
        slug: json["slug"],
        bitlyGifUrl: json["bitly_gif_url"],
        bitlyUrl: json["bitly_url"],
        embedUrl: json["embed_url"],
        username: json["username"],
        source: json["source"],
        title: json["title"],
        rating: json["rating"],
        contentUrl: json["content_url"],
        sourceTld: json["source_tld"],
        sourcePostUrl: json["source_post_url"],
        isSticker: json["is_sticker"],
        importDatetime: json["import_datetime"] == null
            ? null
            : DateTime.parse(json["import_datetime"]),
        trendingDatetime: json["trending_datetime"],
        images: json["images"] == null ? null : Images.fromMap(json["images"]),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        analyticsResponsePayload: json["analytics_response_payload"],
        analytics: json["analytics"] == null
            ? null
            : Analytics.fromMap(json["analytics"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "id": id,
        "url": url,
        "slug": slug,
        "bitly_gif_url": bitlyGifUrl,
        "bitly_url": bitlyUrl,
        "embed_url": embedUrl,
        "username": username,
        "source": source,
        "title": title,
        "rating": rating,
        "content_url": contentUrl,
        "source_tld": sourceTld,
        "source_post_url": sourcePostUrl,
        "is_sticker": isSticker,
        "import_datetime": importDatetime?.toIso8601String(),
        "trending_datetime": trendingDatetime,
        "images": images?.toMap(),
        "user": user?.toMap(),
        "analytics_response_payload": analyticsResponsePayload,
        "analytics": analytics?.toMap(),
      };
}

class Analytics {
  Onclick? onload;
  Onclick? onclick;
  Onclick? onsent;

  Analytics({
    this.onload,
    this.onclick,
    this.onsent,
  });

  factory Analytics.fromMap(Map<String, dynamic> json) => Analytics(
        onload: json["onload"] == null ? null : Onclick.fromMap(json["onload"]),
        onclick:
            json["onclick"] == null ? null : Onclick.fromMap(json["onclick"]),
        onsent: json["onsent"] == null ? null : Onclick.fromMap(json["onsent"]),
      );

  Map<String, dynamic> toMap() => {
        "onload": onload?.toMap(),
        "onclick": onclick?.toMap(),
        "onsent": onsent?.toMap(),
      };
}

class Onclick {
  String? url;

  Onclick({
    this.url,
  });

  factory Onclick.fromMap(Map<String, dynamic> json) => Onclick(
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
      };
}

class Images {
  FixedHeight? original;
  FixedHeight? fixedHeight;
  FixedHeight? fixedHeightDownsampled;
  FixedHeight? fixedHeightSmall;
  FixedHeight? fixedWidth;
  FixedHeight? fixedWidthDownsampled;
  FixedHeight? fixedWidthSmall;

  Images({
    this.original,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
    this.fixedWidth,
    this.fixedWidthDownsampled,
    this.fixedWidthSmall,
  });

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        original: json["original"] == null
            ? null
            : FixedHeight.fromMap(json["original"]),
        fixedHeight: json["fixed_height"] == null
            ? null
            : FixedHeight.fromMap(json["fixed_height"]),
        fixedHeightDownsampled: json["fixed_height_downsampled"] == null
            ? null
            : FixedHeight.fromMap(json["fixed_height_downsampled"]),
        fixedHeightSmall: json["fixed_height_small"] == null
            ? null
            : FixedHeight.fromMap(json["fixed_height_small"]),
        fixedWidth: json["fixed_width"] == null
            ? null
            : FixedHeight.fromMap(json["fixed_width"]),
        fixedWidthDownsampled: json["fixed_width_downsampled"] == null
            ? null
            : FixedHeight.fromMap(json["fixed_width_downsampled"]),
        fixedWidthSmall: json["fixed_width_small"] == null
            ? null
            : FixedHeight.fromMap(json["fixed_width_small"]),
      );

  Map<String, dynamic> toMap() => {
        "original": original?.toMap(),
        "fixed_height": fixedHeight?.toMap(),
        "fixed_height_downsampled": fixedHeightDownsampled?.toMap(),
        "fixed_height_small": fixedHeightSmall?.toMap(),
        "fixed_width": fixedWidth?.toMap(),
        "fixed_width_downsampled": fixedWidthDownsampled?.toMap(),
        "fixed_width_small": fixedWidthSmall?.toMap(),
      };
}

class FixedHeight {
  String? height;
  String? width;
  String? size;
  String? url;
  String? mp4Size;
  String? mp4;
  String? webpSize;
  String? webp;
  String? frames;
  String? hash;

  FixedHeight({
    this.height,
    this.width,
    this.size,
    this.url,
    this.mp4Size,
    this.mp4,
    this.webpSize,
    this.webp,
    this.frames,
    this.hash,
  });

  factory FixedHeight.fromMap(Map<String, dynamic> json) => FixedHeight(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
        webpSize: json["webp_size"],
        webp: json["webp"],
        frames: json["frames"],
        hash: json["hash"],
      );

  Map<String, dynamic> toMap() => {
        "height": height,
        "width": width,
        "size": size,
        "url": url,
        "mp4_size": mp4Size,
        "mp4": mp4,
        "webp_size": webpSize,
        "webp": webp,
        "frames": frames,
        "hash": hash,
      };
}

class User {
  String? avatarUrl;
  String? bannerImage;
  String? bannerUrl;
  String? profileUrl;
  String? username;
  String? displayName;
  String? description;
  String? instagramUrl;
  String? websiteUrl;
  bool? isVerified;

  User({
    this.avatarUrl,
    this.bannerImage,
    this.bannerUrl,
    this.profileUrl,
    this.username,
    this.displayName,
    this.description,
    this.instagramUrl,
    this.websiteUrl,
    this.isVerified,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        avatarUrl: json["avatar_url"],
        bannerImage: json["banner_image"],
        bannerUrl: json["banner_url"],
        profileUrl: json["profile_url"],
        username: json["username"],
        displayName: json["display_name"],
        description: json["description"],
        instagramUrl: json["instagram_url"],
        websiteUrl: json["website_url"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toMap() => {
        "avatar_url": avatarUrl,
        "banner_image": bannerImage,
        "banner_url": bannerUrl,
        "profile_url": profileUrl,
        "username": username,
        "display_name": displayName,
        "description": description,
        "instagram_url": instagramUrl,
        "website_url": websiteUrl,
        "is_verified": isVerified,
      };
}

class Meta {
  int? status;
  String? msg;
  String? responseId;

  Meta({
    this.status,
    this.msg,
    this.responseId,
  });

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        status: json["status"],
        msg: json["msg"],
        responseId: json["response_id"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "msg": msg,
        "response_id": responseId,
      };
}

class Pagination {
  int? totalCount;
  int? count;
  int? offset;

  Pagination({
    this.totalCount,
    this.count,
    this.offset,
  });

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        totalCount: json["total_count"],
        count: json["count"],
        offset: json["offset"],
      );

  Map<String, dynamic> toMap() => {
        "total_count": totalCount,
        "count": count,
        "offset": offset,
      };
}
