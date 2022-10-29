import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/injection_container.dart' as di;
import 'package:movie_app/core/injection_container.dart';
import 'package:movie_app/core/network/bloc/network_info_bloc.dart';
import 'package:movie_app/features/domain/usecase/get_movies_details.dart';
import 'package:movie_app/features/presentation/bloc/home_page_bloc.dart';
import 'package:movie_app/features/presentation/view/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize singletons
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Tb',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NetworkInfoBloc>(create: (context) => NetworkInfoBloc()),
          BlocProvider(
              create: (context) =>
                  HomePageBloc(getMovieDetails: sl<GetMovieDetails>()))
        ],
        child: const HomePage(),
      ),
    );
  }
}
