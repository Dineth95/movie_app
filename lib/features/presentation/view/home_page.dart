import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/core/network/bloc/network_info_bloc.dart';
import 'package:movie_app/features/presentation/bloc/home_page_bloc.dart';
import 'package:movie_app/features/presentation/view/custom_widgets/loading_widget.dart';
import 'package:movie_app/features/presentation/view/custom_widgets/movie_list_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Add Pagination for the UI
  ScrollController? _controller;
  bool _isFetching = false;

  @override
  void initState() {
    _controller = ScrollController();

    ///subscribe the network status
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          context.read<NetworkInfoBloc>().add(NetworkOnline());

          break;
        case InternetConnectionStatus.disconnected:
          context.read<NetworkInfoBloc>().add(NetworkOffline());

          break;
      }
    });

    super.initState();
  }

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
      body: BlocListener<NetworkInfoBloc, NetworkInfoState>(
        listener: (context, state) {
          if (state is NetworkOfflineState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please check yout internet connection'),
              backgroundColor: Colors.redAccent,
            ));
          }
        },
        child: BlocConsumer<HomePageBloc, HomePageState>(
            listener: (context, state) {
          if (state is MovieDetailsLoaded) {
            setState(() {
              _isFetching = false;
            });
          }

          if (state is HomePageloadingFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.redAccent,
            ));
          }
        }, builder: ((context, state) {
          if (state is MovieDetailsLoaded) {
            return RefreshIndicator(
                onRefresh: () {
                  context
                      .read<HomePageBloc>()
                      .add(const GetTopRatedMoviesEvent(index: 1, reset: true));
                  return Future.delayed(Duration.zero);
                },
                child: ListView(
                  controller: _controller!
                    ..addListener(() {
                      if (_controller!.position.pixels >
                              _controller!.position.maxScrollExtent * 0.7 &&
                          _isFetching == false &&
                          !context.read<HomePageBloc>().state.noMore) {
                        setState(() {
                          _isFetching = true;
                        });
                        context
                            .read<HomePageBloc>()
                            .add(FetchNextTopRatedPage());
                      }
                    }),
                  children: [
                    ...List.generate(
                        state.moviesList!.length,
                        (index) => MovieListItem(
                            resultModel: state.moviesList![index],
                            index: index + 1)),
                    _isFetching
                        ? const SizedBox(
                            height: 200,
                            child: Center(child: CupertinoActivityIndicator()),
                          )
                        : Container()
                  ],
                  padding: const EdgeInsets.only(bottom: 0),
                  shrinkWrap: true,
                ));
          } else {
            return SingleChildScrollView(
              child: Column(
                  children: List.generate(5, (index) => const LoadingWidget())),
            );
          }
        })),
      ),
    );
  }
}
