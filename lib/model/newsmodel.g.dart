// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewFeedModel _$NewFeedModelFromJson(Map<String, dynamic> json) => NewFeedModel(
      category: json['category'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool,
    );

Map<String, dynamic> _$NewFeedModelToJson(NewFeedModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'success': instance.success,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      author: json['author'] as String,
      content: json['content'] as String,
      date: json['date'] as String,
      imageUrl: json['imageUrl'] as String,
      readMoreUrl: json['readMoreUrl'] as String?,
      time: json['time'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'date': instance.date,
      'imageUrl': instance.imageUrl,
      'readMoreUrl': instance.readMoreUrl,
      'time': instance.time,
      'title': instance.title,
      'url': instance.url,
    };
