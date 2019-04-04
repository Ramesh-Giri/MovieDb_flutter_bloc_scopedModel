import 'package:http/http.dart'as http;
import 'package:movie_db_bloc/models/api_response.dart';
import 'package:movie_db_bloc/models/movies.dart';
import 'dart:convert';
import 'api_key.dart';

class MovieApiProvider{
  String _popularBaseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY&page=";
  String _upcomingbaseUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=$API_KEY";


  final successCode = 200;

  Future<List<Movies>> fetchPopularMovies(int page) async{
    final response  = await http.get(_popularBaseUrl+page.toString());
    final responseString = jsonDecode(response.body);
    if (response.statusCode == successCode) {
      return ApiResult.fromJson(responseString).results;
    } else {
      throw Exception("failed to load movies");
    }
  }

  Future<List<Movies>> fetchUpcomingMovies() async{
    final response  = await http.get(_upcomingbaseUrl);
    final responseString = jsonDecode(response.body);
    if (response.statusCode == successCode) {
      return ApiResult.fromJson(responseString).results;
    } else {
      throw Exception("failed to load movies");
    }
  }


}