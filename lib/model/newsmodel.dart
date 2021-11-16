import 'package:json_annotation/json_annotation.dart';

part 'newsmodel.g.dart';

@JsonSerializable(explicitToJson: true)
class NewFeedModel {
  NewFeedModel({
    required this.category,
    required this.data,
    required this.success,
  });

  final String category;
  final List<Data> data;
  final bool success;

  /// A necessary factory constructor for creating a new NewFeedModel instance
  /// from a map. Pass the map to the generated `_$NewFeedModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, NewFeedModel.
  factory NewFeedModel.fromJson(Map<String, dynamic> json) =>
      _$NewFeedModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$NewFeedModelToJson`.
  Map<String, dynamic> toJson() => _$NewFeedModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.author,
    required this.content,
    required this.date,
    required this.imageUrl,
    this.readMoreUrl,
    required this.time,
    required this.title,
    required this.url,
  });

  final String author;
  final String content;
  final String date;
  final String imageUrl;
  final String? readMoreUrl;
  final String time;
  final String title;
  final String url;

  /// A necessary factory constructor for creating a new Data instance
  /// from a map. Pass the map to the generated `_$DataFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Data.
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$DataToJson`.
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
