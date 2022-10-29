import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie_app/core/serializers/serializers.dart';

part 'result_model.g.dart';

abstract class ResultModel implements Built<ResultModel, ResultModelBuilder> {
  // Fields
  bool? get adult;

  @BuiltValueField(wireName: 'backdrop_path')
  String? get backdropPath;

  double? get popularity;

  @BuiltValueField(wireName: 'original_language')
  String? get originalLanguage;

  @BuiltValueField(wireName: 'original_title')
  String? get originalTitle;

  String? get overview;

  @BuiltValueField(wireName: 'poster_path')
  String? get posterPath;

  @BuiltValueField(wireName: 'release_date')
  String? get releaseDate;

  String? get title;

  @BuiltValueField(wireName: 'vote_average')
  double? get voteAverage;

  @BuiltValueField(wireName: 'vote_count')
  double? get voteCount;

  ResultModel._();

  factory ResultModel([void Function(ResultModelBuilder) updates]) =
      _$ResultModel;

  String toJson() {
    return json.encode(serializers.serializeWith(ResultModel.serializer, this));
  }

  static ResultModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        ResultModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<ResultModel> get serializer => _$resultModelSerializer;
}
