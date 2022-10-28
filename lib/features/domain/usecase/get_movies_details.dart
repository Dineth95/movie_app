import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/data/models/top_rated_movie_response_model.dart';
import 'package:movie_app/features/domain/repository/movie_repository.dart';

class GetMovieDetails implements UseCase<TopRatedMovieResponseModel,ParamsGetTopRatedMovieDetails>{
  final MovieRepository movieRepository;

  GetMovieDetails({required this.movieRepository});

  @override
  Future<Either<Failure, TopRatedMovieResponseModel>> call(ParamsGetTopRatedMovieDetails params) async{
    return await movieRepository.getTopRatedMovieDetails(params.page);
  }
  
}

class ParamsGetTopRatedMovieDetails extends Equatable{
  final String page;

  const ParamsGetTopRatedMovieDetails({required this.page});

  @override
  List<Object?> get props => [page];
}