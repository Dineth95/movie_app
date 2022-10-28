part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class MovieDetailsLoaded extends HomePageState {
  final List<ResultModel> moviesList;

  const MovieDetailsLoaded({required this.moviesList});

  @override
  List<Object> get props => [moviesList];
}

class HomePageloadingFailed extends HomePageState {
  final String message;

  const HomePageloadingFailed({required this.message});

  @override
  List<Object> get props => [message];
}
