import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/data/models/top_rated_movie_response_model.dart';

abstract class MovieRepository {
  Future<Either<Failure, TopRatedMovieResponseModel>> getTopRatedMovieDetails(String page);
}
