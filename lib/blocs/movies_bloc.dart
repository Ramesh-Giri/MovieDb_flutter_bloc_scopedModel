import 'package:movie_db_bloc/blocs/movies_listing_event.dart';
import 'package:movie_db_bloc/blocs/movies_listing_state.dart';
import 'package:movie_db_bloc/models/movies.dart';
import 'package:movie_db_bloc/services/repository.dart';
import 'package:bloc/bloc.dart';

class MoviesBloc extends Bloc<MoviesListingEvent, MoviesListingState> {
  final MoviesRepository moviesRepository;

  MoviesBloc({this.moviesRepository}) : assert(moviesRepository != null);

  @override
  MoviesListingState get initialState => MoviesFetchingState();

  @override
  Stream<MoviesListingState> mapEventToState(MoviesListingEvent event) async* {
    yield MoviesFetchingState();
    try {
      List<Movies> movies;
      if (event is OnLoadEvent) {
        movies = await moviesRepository.fetchPopularMovies(1);
      }

      if (movies.length == 0) {
        yield MoviesEmptyState();
      } else {
        yield MoviesFetchedState(movies: movies);
      }
    } catch (e) {
      print(e.toString());
      yield MoviesErrorState();
    }
  }
}
