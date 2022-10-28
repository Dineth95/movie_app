part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class GetTopRatedMoviesEvent extends HomePageEvent {
  final int page;

  const GetTopRatedMoviesEvent({required this.page});

  @override
  List<Object> get props => [page];
}
