import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_bloc/blocs/movies_listing_event.dart';
import 'package:movie_db_bloc/blocs/movies_listing_state.dart';
import 'package:movie_db_bloc/blocs/upcoming_movies_bloc.dart';
import 'package:movie_db_bloc/widgets/horizontal_movie_list.dart';
class UpcomingMoviesListing extends StatefulWidget{
  @override
  _UpcomingMoviesListingState createState() => _UpcomingMoviesListingState();
}

class _UpcomingMoviesListingState extends State<UpcomingMoviesListing> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UpcomingMoviesBloc>(context).dispatch(OnLoadEvent());
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder(
        bloc: BlocProvider.of<UpcomingMoviesBloc>(context),
        builder: (context, state) {
          if (state is MoviesFetchingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MoviesEmptyState) {
            return Center(child: Text("No data found"));
          } else if (state is MoviesErrorState) {
            return Center(child: Text("Something Went wrong"));
          } else {
            final stateAsMoviesFetchedState = state as MoviesFetchedState;
            final movies = stateAsMoviesFetchedState.movies;
            return buildHorizontalMoviesList(movies);
          }
        });
  }
}