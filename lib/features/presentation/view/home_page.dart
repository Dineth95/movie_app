import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/injection_container.dart';
import 'package:movie_app/features/domain/usecase/get_movies_details.dart';
import 'package:movie_app/features/presentation/bloc/home_page_bloc.dart';
import 'package:movie_app/features/presentation/view/custom_widgets/loading_widget.dart';
import 'package:movie_app/features/presentation/view/custom_widgets/movie_list_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Top Rated Movies',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 41, 109),
      ),
      body: BlocProvider(
        create: (context) =>
            HomePageBloc(getMovieDetails: sl<GetMovieDetails>()),
        lazy: false,
        child: BlocBuilder<HomePageBloc, HomePageState>(
            builder: ((context, state) {
          if (state is HomePageLoading) {
            return SingleChildScrollView(
              child: Column(
                  children: List.generate(5, (index) => const LoadingWidget())),
            );
          } else if (state is MovieDetailsLoaded) {
            return RefreshIndicator(
                onRefresh: () {
                  context
                      .read<HomePageBloc>()
                      .add(const GetTopRatedMoviesEvent(page: 1));
                  return Future.delayed(Duration.zero);
                },
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: state.moviesList
                          .toList()
                          .map((result) => MovieListItem(
                              resultModel: result,
                              index: state.moviesList.toList().indexOf(result) +
                                  1))
                          .toList()),
                ));
          } else {
            return Container();
          }
        })),
      ),
    );
  }
}
