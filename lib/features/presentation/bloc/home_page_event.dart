part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class GetTopRatedMoviesEvent extends HomePageEvent {
  final int index;
  final bool? reset;

  const GetTopRatedMoviesEvent({required this.index, this.reset});

  @override
  List<Object> get props => [index];
}

class FetchNextTopRatedPage extends HomePageEvent {}
