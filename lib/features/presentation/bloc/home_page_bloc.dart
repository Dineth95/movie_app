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
    ///Initial Home page data
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

    /// Fetch next page movie details
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
            message: 'Error Occured.Please try again later!',
            selectedIndex: index,
            noMore: state.noMore,
            page: state.page,
            moviesList: state.moviesList));

        ///Internet connection failure
      } else if (failure is ConnectionFailure) {
        emit(HomePageloadingFailed(
            message: 'Please Check your internet connection!',
            selectedIndex: index,
            noMore: state.noMore,
            page: state.page,
            moviesList: state.moviesList));

        ///Other unknown failures(ex: serialization error)
      } else {
        emit(HomePageloadingFailed(
            message: 'Unknown error!',
            selectedIndex: index,
            noMore: state.noMore,
            page: state.page,
            moviesList: state.moviesList));
      }
    }, (data) {
      List<ResultModel>? results = (data.results?.toList() ?? []);

      /// when pull to refresh started
      if (reset ?? false) {
        emit(MovieDetailsLoaded(
            moviesList: results,
            selectedIndex: index,
            noMore: state.noMore,
            page: page));

        ///When there is no data for the current page
        ///At the last page
      } else if (results.isEmpty) {
        emit(MovieDetailsLoaded(
            moviesList: state.moviesList,
            selectedIndex: index,
            noMore: true,
            page: page));

        /// fetch next page data normaly
      } else {
        if (!loading) results = state.moviesList! + results;

        emit(MovieDetailsLoaded(
            moviesList: results,
            selectedIndex: index,
            noMore: state.noMore,
            page: page));
      }
    });
  }
}
