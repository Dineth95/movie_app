import 'package:dio/dio.dart';
import 'package:movie_app/features/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/features/data/models/top_rated_movie_response_model.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/features/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<Either<Failure, TopRatedMovieResponseModel>> getTopRatedMovieDetails(
      String page) async {
    try {
      TopRatedMovieResponseModel topRatedMovieResponseModel =
          await movieRemoteDataSource.getTopRatedMovieDetails(page);
      return Right(topRatedMovieResponseModel);
    } on DioError catch (err) {
      return Left(ServerFailure(err.message));
    } catch (err) {
      return Left(ConnectionFailure());
    }
  }
}
