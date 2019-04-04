import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_bloc/blocs/movies_bloc.dart';
import 'package:movie_db_bloc/blocs/movies_listing_event.dart';
import 'package:movie_db_bloc/blocs/movies_listing_state.dart';
import 'package:movie_db_bloc/widgets/movie_list.dart';
import '../widgets/loading_screen.dart';

class PopularMoviesListing extends StatefulWidget {
  @override
  _MoviesListingState createState() => _MoviesListingState();
}

class _MoviesListingState extends State<PopularMoviesListing> {

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesBloc>(context).dispatch(OnLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<MoviesBloc>(context),
        builder: (context, state) {
          if (state is MoviesFetchingState) {
            return buildLoadingScreen();
          } else if (state is MoviesEmptyState) {
            return Center(child: Text("No data found"));
          } else if (state is MoviesErrorState) {
            return Center(child: Text("Something Went wrong"));
          } else {
            final stateAsMoviesFetchedState = state as MoviesFetchedState;
            final movies = stateAsMoviesFetchedState.movies;
            return buildMoviesList(movies, _controller);
          }
        });
  }
}
