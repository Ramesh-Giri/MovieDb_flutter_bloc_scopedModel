import 'package:flutter/material.dart';
import 'package:movie_db_bloc/models/movies.dart';
import 'package:movie_db_bloc/services/api_key.dart';
import 'package:movie_db_bloc/theme.dart';

class DetailPage extends StatelessWidget {
  final Movies movie;

  DetailPage({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text("${movie.title}", style: whiteTextRegular),
                  background: Image.network(
                    "${baseImageUrl + movie.backdropPath}",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(movie.overview, style: TextStyle(fontSize: 16.0),),
            ),
          ],
        ),
      ),
    );
  }
}
