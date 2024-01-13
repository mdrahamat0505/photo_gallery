// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_popular_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MostPopularModel _$MostPopularModelFromJson(Map<String, dynamic> json) =>
    MostPopularModel(
      currentPage: json['currentPage'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['firstPageUrl'] as String?,
      from: json['from'] as int?,
      lastPage: json['lastPage'] as int?,
      lastPageUrl: json['lastPageUrl'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['nextPageUrl'] as String?,
      path: json['path'] as String?,
      perPage: json['perPage'] as int?,
      prevPageUrl: json['prevPageUrl'],
      to: json['to'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$MostPopularModelToJson(MostPopularModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.data,
      'firstPageUrl': instance.firstPageUrl,
      'from': instance.from,
      'lastPage': instance.lastPage,
      'lastPageUrl': instance.lastPageUrl,
      'links': instance.links,
      'nextPageUrl': instance.nextPageUrl,
      'path': instance.path,
      'perPage': instance.perPage,
      'prevPageUrl': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      photo: json['photo'] as String?,
      status: json['status'] as int?,
      collections: json['collections'] as String?,
      collectionsName: json['collectionsName'] as String?,
      colors: json['colors'] as String?,
      colorsName: json['colorsName'] as String?,
      tags: json['tags'] as String?,
      totalHeartCount: json['totalHeartCount'] as int?,
      totalViewCount: json['totalViewCount'] as int?,
      totalDownloadCount: json['totalDownloadCount'] as int?,
      lastViewDatetime: json['lastViewDatetime'] == null
          ? null
          : DateTime.parse(json['lastViewDatetime'] as String),
      deletedAt: json['deletedAt'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photo': instance.photo,
      'status': instance.status,
      'collections': instance.collections,
      'collectionsName': instance.collectionsName,
      'colors': instance.colors,
      'colorsName': instance.colorsName,
      'tags': instance.tags,
      'totalHeartCount': instance.totalHeartCount,
      'totalViewCount': instance.totalViewCount,
      'totalDownloadCount': instance.totalDownloadCount,
      'lastViewDatetime': instance.lastViewDatetime?.toIso8601String(),
      'deletedAt': instance.deletedAt,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
