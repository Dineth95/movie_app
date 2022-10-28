import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/data/models/result_model.dart';
import 'package:movie_app/features/domain/usecase/get_movies_details.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetMovieDetails getMovieDetails;

  HomePageBloc({required this.getMovieDetails}) : super(HomePageInitial()) {
    on<GetTopRatedMoviesEvent>((event, emit) async {
      emit(HomePageLoading());
      final response = await getMovieDetails(
          ParamsGetTopRatedMovieDetails(page: event.page.toString()));

      response.fold((failure) async {
        if (failure is ServerFailure) {
          emit(const HomePageloadingFailed(message: 'server failure'));
        } else if (failure is ConnectionFailure) {
          emit(const HomePageloadingFailed(message: 'connection failure'));
        } else {
          emit(const HomePageloadingFailed(message: 'unknown error'));
        }
      }, (data) {
        emit(MovieDetailsLoaded(moviesList: data.results.toList()));
      });
    });

    add(const GetTopRatedMoviesEvent(page: 1));
  }
}
