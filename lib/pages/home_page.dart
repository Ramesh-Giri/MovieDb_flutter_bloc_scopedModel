import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_bloc/blocs/movies_bloc.dart';
import 'package:movie_db_bloc/blocs/theme_model.dart';
import 'package:movie_db_bloc/blocs/upcoming_movies_bloc.dart';
import 'package:movie_db_bloc/pages/popular_movies_listing.dart';
import 'package:movie_db_bloc/pages/upcoming_movies_listing.dart';
import 'package:movie_db_bloc/services/repository.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  final MoviesRepository moviesRepository;
  HomePage({this.moviesRepository});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  MoviesBloc _moviesBloc;
  UpcomingMoviesBloc _upcomingMoviesBloc;


  @override
  void initState() {
    super.initState();
    _moviesBloc = MoviesBloc(moviesRepository: widget.moviesRepository);
    _upcomingMoviesBloc = UpcomingMoviesBloc(moviesRepository: widget.moviesRepository);
  }

  @override
  void dispose() {
    super.dispose();
    _moviesBloc.dispose();
    _upcomingMoviesBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
        blocProviders: [
          BlocProvider<UpcomingMoviesBloc>(bloc: _upcomingMoviesBloc),
          BlocProvider<MoviesBloc>(bloc: _moviesBloc),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text("The MovieDb"),
            actions: <Widget>[
              ScopedModelDescendant<ThemeModel>(
                builder: (context, child, model) {
                  return IconButton(
                    onPressed: () async {
                      await model.changeTheme();
                    },
                    icon: model.theme ? Icon(Icons.brightness_3) : Icon(Icons.brightness_7),
                  );
                },
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              Expanded(flex: 1, child: UpcomingMoviesListing()),
              Expanded(flex: 2, child: PopularMoviesListing())
            ],
          ),
        ));
  }
}
