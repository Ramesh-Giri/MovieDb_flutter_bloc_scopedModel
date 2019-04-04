import 'package:flutter/material.dart';
import 'package:movie_db_bloc/blocs/theme_model.dart';
import 'package:movie_db_bloc/pages/home_page.dart';
import 'package:movie_db_bloc/services/repository.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  MoviesRepository _movieRepository = MoviesRepository();
  runApp(ScopedModel<ThemeModel>(
    model: ThemeModel(),
    child: MyApp(moviesRepository: _movieRepository),
  ));
}

class MyApp extends StatefulWidget {
  final MoviesRepository moviesRepository;

  MyApp({this.moviesRepository});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool theme = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(
      builder: (BuildContext context, Widget child, ThemeModel model) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: model.theme ? ThemeData.light() : ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: HomePage(
            moviesRepository: widget.moviesRepository,
          ),
        );
      },
    );
  }
}
