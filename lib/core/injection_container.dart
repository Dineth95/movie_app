import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/config.dart';
import 'package:movie_app/core/interceptors/dio_interceptor.dart';
import 'package:movie_app/features/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/features/data/repository/movie_repository_impl.dart';
import 'package:movie_app/features/domain/repository/movie_repository.dart';
import 'package:movie_app/features/domain/usecase/get_movies_details.dart';
import 'package:tf_dio_cache/dio_http_cache.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Dio
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = Config.baseUrl;
    dio.interceptors.add(DioInterceptor());

    // Add Cache Config
    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: Config.baseUrl)).interceptor);
    return dio;
  });

  // data Sources
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(dio: sl()));

  //Repository
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(movieRemoteDataSource: sl()));

  // Use Case
  sl.registerLazySingleton<GetMovieDetails>(
      () => GetMovieDetails(movieRepository: sl()));
}
