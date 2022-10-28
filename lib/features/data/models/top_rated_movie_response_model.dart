import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie_app/core/serializers/serializers.dart';
import 'package:movie_app/features/data/models/result_model.dart';

part 'top_rated_movie_response_model.g.dart';

abstract class TopRatedMovieResponseModel implements Built<TopRatedMovieResponseModel, TopRatedMovieResponseModelBuilder> {
  // Fields
  int? get page;

  @BuiltValueField(wireName: 'total_pages')
  int? get totalPages;

  BuiltList<ResultModel> get results;

  @BuiltValueField(wireName: 'total_results')
  int? get totalResults;

  TopRatedMovieResponseModel._();

  factory TopRatedMovieResponseModel([void Function(TopRatedMovieResponseModelBuilder) updates]) = _$TopRatedMovieResponseModel;

  String toJson() {
    return json.encode(serializers.serializeWith(TopRatedMovieResponseModel.serializer, this));
  }

  static TopRatedMovieResponseModel fromJson(String jsonString) {
    return serializers.deserializeWith(TopRatedMovieResponseModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<TopRatedMovieResponseModel> get serializer => _$topRatedMovieResponseModelSerializer;
}