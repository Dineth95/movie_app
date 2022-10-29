import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/core/config.dart';
import 'package:movie_app/features/data/models/top_rated_movie_response_model.dart';
import 'package:tf_dio_cache/dio_http_cache.dart';

abstract class MovieRemoteDataSource {
  /// Calls the [baseUrl]/v2/top-headlines?category=:category&country=:country&apiKey=:apiKey endpoint
  ///
  /// Throws a [DioError] for all error codes.
  Future<TopRatedMovieResponseModel> getTopRatedMovieDetails(String page);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<TopRatedMovieResponseModel> getTopRatedMovieDetails(
      String page) async {
    Response response = await dio.get(Config.topRatedMovieURL,
        queryParameters: {
          'api_key': Config.apiKey,
          'language': 'en-US',
          'page': page
        },
        /*
        Get data from network first.
        If getting data from network succeeds, store or refresh cache.
        If getting data from network fails or no network avaliable, try get data from cache instead of an error.
        */
        options:
            buildCacheOptions(const Duration(days: 1), forceRefresh: true));

    return TopRatedMovieResponseModel.fromJson(jsonEncode(response.data));
  }
}
