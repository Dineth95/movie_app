import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:movie_app/features/data/models/result_model.dart';
import 'package:movie_app/features/data/models/top_rated_movie_response_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  TopRatedMovieResponseModel,
  ResultModel
])

final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();