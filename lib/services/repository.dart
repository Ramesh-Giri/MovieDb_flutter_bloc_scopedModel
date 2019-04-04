import 'package:movie_db_bloc/models/movies.dart';
import 'package:movie_db_bloc/services/movie_api_provider.dart';

class MoviesRepository {
  MovieApiProvider _movieApiProvider = MovieApiProvider();

  Future<List<Movies>> fetchPopularMovies(int page) {
    return _movieApiProvider.fetchPopularMovies(page);
  }

  Future<List<Movies>> fetchUpcomingMovies() {
    return _movieApiProvider.fetchUpcomingMovies();
  }
}
