part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  final int? selectedIndex;
  final int? page;
  final bool noMore;
  final List<ResultModel>? moviesList;

  const HomePageState(
      {required this.selectedIndex,
      required this.page,
      required this.noMore,
      required this.moviesList});

  @override
  List<Object?> get props => [];
}

class HomePageInitial extends HomePageState {
  const HomePageInitial(
      {required int? selectedIndex,
      required int? page,
      required bool noMore,
      required List<ResultModel>? moviesList})
      : super(
            selectedIndex: selectedIndex,
            page: page,
            noMore: noMore,
            moviesList: moviesList);
}

class HomePageLoading extends HomePageState {
  const HomePageLoading(
      {required int? selectedIndex,
      required int? page,
      required bool noMore,
      required List<ResultModel>? moviesList})
      : super(
            selectedIndex: selectedIndex,
            page: page,
            noMore: noMore,
            moviesList: moviesList);

  @override
  List<Object?> get props => [selectedIndex];
}

class MovieDetailsLoaded extends HomePageState {

  const MovieDetailsLoaded(
      {required int? selectedIndex,
      required int? page,
      required bool noMore,
      required List<ResultModel>? moviesList})
      : super(
            selectedIndex: selectedIndex,
            page: page,
            noMore: noMore,
            moviesList: moviesList);

  @override
  List<Object?> get props => [moviesList, selectedIndex, noMore, page];
}

class HomePageloadingFailed extends HomePageState {
  final String message;

  const HomePageloadingFailed(
      {required this.message,
      required int? selectedIndex,
      required int? page,
      required bool noMore,
      required List<ResultModel>? moviesList})
      : super(
            selectedIndex: selectedIndex,
            page: page,
            noMore: noMore,
            moviesList: moviesList);

  @override
  List<Object?> get props => [message, selectedIndex];
}
