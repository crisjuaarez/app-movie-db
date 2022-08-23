import 'dart:convert';

import 'package:app_cinema/src/data/models/movie_model.dart';
import 'package:app_cinema/src/domain/entities/cast.dart';

import 'package:http/http.dart' as http;

class MoviesApi {
  static const String _apiKey = 'YOUR_API_KEY';

  static Future<List<Cast>> getMovieCasts(String id) async {
    String url =
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final String data = response.body;
      // print(data);
      final Map<String, dynamic> json = jsonDecode(data);
      final List results = json['cast'];
      final List<Cast> casts = [];

      for (var result in results) {
        casts.add(Cast.fromMap(result));
      }
      print(casts.length);

      return casts;
    }
    return [];
  }

  static Future<MovieModel?> getMovieDetails(String id) async {
    String url = 'https://api.themoviedb.org/3/movie/$id?api_key=$_apiKey';
    final response = await http.get(Uri.parse(url));
    MovieModel? movie;

    if (response.statusCode == 200) {
      final String data = response.body;
      final Map<String, dynamic> json = jsonDecode(data);
      movie = MovieModel.fromJson(json);
    }
    return movie;
  }

  static Future<List<MovieModel>> getMoviesByCategory(String category) async {
    String url =
        'https://api.themoviedb.org/3/movie/$category?api_key=$_apiKey';
    final response = await http.get(Uri.parse(url));
    print('getting movies in $category');

    if (response.statusCode == 200) {
      final String data = response.body;
      print(data);
      final Map<String, dynamic> json = jsonDecode(data);
      final List results = json['results'];
      final List<MovieModel> movies = [];

      for (var result in results) {
        final movie = MovieModel.fromJson(result);
        print(movie.title);
        movies.add(movie);
      }
      return movies;
    }
    return [];
  }
}
