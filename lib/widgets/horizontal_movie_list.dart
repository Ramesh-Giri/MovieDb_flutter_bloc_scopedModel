import 'package:flutter/material.dart';
import 'package:movie_db_bloc/models/movies.dart';
import '../services/api_key.dart';

Widget buildHorizontalMoviesList(List<Movies> movies) {
  return ListView.builder(
    itemCount: movies.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      Movies movie = movies[index];
      return Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                image: movie.posterPath != null ? DecorationImage(image: NetworkImage("${baseImageUrl + movie.posterPath}", scale: 120.0),fit: BoxFit.cover) : null,
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              height: 60,
              color: Colors.black38.withOpacity(0.3),
              child: Center(
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
