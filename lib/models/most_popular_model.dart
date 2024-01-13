import 'package:json_annotation/json_annotation.dart';
part 'most_popular_model.g.dart';

@JsonSerializable()
class MostPopularModel {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  MostPopularModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  MostPopularModel copyWith({
    int? currentPage,
    List<Datum>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      MostPopularModel(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        links: links ?? this.links,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory MostPopularModel.fromJson(Map<String, dynamic> json) =>
      _$MostPopularModelFromJson(json);
  Map<String, dynamic> toJson() => _$MostPopularModelToJson(this);
}

@JsonSerializable()
class Datum {
  int? id;
  String? name;
  String? description;
  String? photo;
  int? status;
  String? collections;
  String? collectionsName;
  String? colors;
  String? colorsName;
  String? tags;
  int? totalHeartCount;
  int? totalViewCount;
  int? totalDownloadCount;
  DateTime? lastViewDatetime;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.description,
    this.photo,
    this.status,
    this.collections,
    this.collectionsName,
    this.colors,
    this.colorsName,
    this.tags,
    this.totalHeartCount,
    this.totalViewCount,
    this.totalDownloadCount,
    this.lastViewDatetime,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Datum copyWith({
    int? id,
    String? name,
    String? description,
    String? photo,
    int? status,
    String? collections,
    String? collectionsName,
    String? colors,
    String? colorsName,
    String? tags,
    int? totalHeartCount,
    int? totalViewCount,
    int? totalDownloadCount,
    DateTime? lastViewDatetime,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        photo: photo ?? this.photo,
        status: status ?? this.status,
        collections: collections ?? this.collections,
        collectionsName: collectionsName ?? this.collectionsName,
        colors: colors ?? this.colors,
        colorsName: colorsName ?? this.colorsName,
        tags: tags ?? this.tags,
        totalHeartCount: totalHeartCount ?? this.totalHeartCount,
        totalViewCount: totalViewCount ?? this.totalViewCount,
        totalDownloadCount: totalDownloadCount ?? this.totalDownloadCount,
        lastViewDatetime: lastViewDatetime ?? this.lastViewDatetime,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
