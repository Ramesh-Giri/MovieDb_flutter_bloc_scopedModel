import 'package:movie_db_bloc/models/movies.dart';

class ApiResult {
  String page;
  String totalResults;
  String totalPages;
  List<Movies> results;

  ApiResult({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  ApiResult.fromJson(Map<String, dynamic> json) {
    page = json['page'].toString();
    totalPages = json['total_pages'].toString();
    totalResults = json['total_results'].toString();
    if (json['results'] != null) {
      results = List<Movies>();
      json['results'].forEach((v) {
        results.add(Movies.fromJson(v));
      });
    }
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if(this.results != null){
      data['results'] = this.results.map((v){
        return v.toJson();
      }).toList();
    }
    return data;
  }
}