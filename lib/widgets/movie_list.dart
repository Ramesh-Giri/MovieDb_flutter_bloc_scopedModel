import 'package:flutter/material.dart';
import 'package:movie_db_bloc/models/movies.dart';
import 'package:movie_db_bloc/widgets/movie_item.dart';
import '../services/api_key.dart';

Widget buildMoviesList(List<Movies> movies, ScrollController _controller) {
  return ListView.separated(
      controller: _controller,
      itemBuilder: (context, index) {
        Movies movie = movies[index];
        return MovieItem(movie: movie,);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 8.0,
          color: Colors.transparent,
        );
      },
      itemCount: movies.length);
}
