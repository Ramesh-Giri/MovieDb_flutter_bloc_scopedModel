import 'package:meta/meta.dart';
import 'package:movie_db_bloc/models/movies.dart';

abstract class MoviesListingState {}

class MoviesFetchingState extends MoviesListingState {}

class MoviesFetchedState extends MoviesListingState {
  final List<Movies> movies;

  MoviesFetchedState({@required this.movies}) : assert(movies != null);
}

class MoviesErrorState extends MoviesListingState {}

class MoviesEmptyState extends MoviesListingState {}