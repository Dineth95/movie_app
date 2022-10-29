import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/data/models/result_model.dart';
import 'package:movie_app/features/domain/usecase/get_movies_details.dart';
import 'package:rxdart/rxdart.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetMovieDetails getMovieDetails;

  HomePageBloc({required this.getMovieDetails})
      : super(const HomePageInitial(
            moviesList: null, noMore: false, selectedIndex: 1, page: 1)) {
    on<GetTopRatedMoviesEvent>(
      (event, emit) => _mapHomepageToState(
          index: event.index,
          loading: true,
          page: 1,
          reset: event.reset,
          emit: emit),
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 300))
            .asyncExpand(mapper);
      },
    );

    on<FetchNextTopRatedPage>(
        (event, emit) => _mapHomepageToState(
            loading: false,
            index: state.selectedIndex,
            page: (state.page!) + 1,
            emit: emit), transformer: (events, mapper) {
      return events
          .debounceTime(const Duration(milliseconds: 500))
          .asyncExpand(mapper);
    });

    add(const GetTopRatedMoviesEvent(index: 1));
  }

  _mapHomepageToState(
      {int? index, required bool loading, int? page, bool? reset, emit}) async {
    if (loading) {
      emit(HomePageLoading(
          page: 1,
          selectedIndex: index,
          noMore: false,
          moviesList: state.moviesList));
    }
    final response = await getMovieDetails(
        ParamsGetTopRatedMovieDetails(page: page.toString()));

    response.fold((failure) async {
      if (failure is ServerFailure) {
        emit(HomePageloadingFailed(
            message: 'server failure',
            selectedIndex: index,
            noMore: state.noMore,
            page: state.page,
            moviesList: state.moviesList));
      } else if (failure is ConnectionFailure) {
        emit(HomePageloadingFailed(
            message: 'connection failure',
            selectedIndex: index,
            noMore: state.noMore,
            page: state.page,
            moviesList: state.moviesList));
      } else {
        emit(HomePageloadingFailed(
            message: 'unknown error',
            selectedIndex: index,
            noMore: state.noMore,
            page: state.page,
            moviesList: state.moviesList));
      }
    }, (data) {
      List<ResultModel>? results = (data.results?.toList() ?? []);

      if (reset ?? false) {
        emit(MovieDetailsLoaded(
            moviesList: results,
            selectedIndex: index,
            noMore: state.noMore,
            page: state.page));
      } else if (results.isEmpty) {
        emit(MovieDetailsLoaded(
            moviesList: state.moviesList,
            selectedIndex: index,
            noMore: true,
            page: state.page));
      } else {
        if (!loading) results = state.moviesList! + results;

        emit(MovieDetailsLoaded(
            moviesList: results,
            selectedIndex: index,
            noMore: state.noMore,
            page: state.page));
      }
    });
  }
}
