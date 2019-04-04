import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_bloc/models/movies.dart';
import 'package:movie_db_bloc/pages/detail_page.dart';
import 'package:movie_db_bloc/services/api_key.dart';
import 'package:movie_db_bloc/theme.dart';

class MovieItem extends StatelessWidget {
  final Movies movie;

  MovieItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) => DetailPage(movie: movie,) ,
            ));
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            height: 250.0,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: NetworkImage(
                      "${baseImageUrl + movie.backdropPath}",
                    ),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: 20.0,
            left: 30.0,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Center(child: Text("12+", style: TextStyle(color: Colors.black),)),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 32.0,
            right: 32.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("3D", style: whiteTextRegular),
                      Text(movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: whiteTextBold),
                    ],
                  ),
                ),
                Text("${movie.voteAverage}", style: whiteTextBold),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*

ListTile(
onTap: () {},
leading: Container(
width: 60.0,
height: 60.0,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(30.0),
image: DecorationImage(
image: NetworkImage(
"${baseImageUrl + movie.posterPath}",
),
fit: BoxFit.cover),
),
),
title: Text(
movie.title,
),
subtitle: Row(
crossAxisAlignment: CrossAxisAlignment.end,
children: <Widget>[
Expanded(
child: Text(
movie.overview,
maxLines: 3,
overflow: TextOverflow.fade,
)),
Text(
"${movie.voteAverage}/10",
style: TextStyle(color: Colors.green),
)
],
),
);*/
