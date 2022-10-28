import 'package:flutter/material.dart';
import 'package:movie_app/core/injection_container.dart' as di;
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
