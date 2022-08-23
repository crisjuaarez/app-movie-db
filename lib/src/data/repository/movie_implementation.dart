import 'package:app_cinema/src/data/models/movie_model.dart';
import 'package:app_cinema/src/domain/entities/cast.dart';

import 'package:app_cinema/src/domain/repositories/movie_repository.dart';

import '../data_source/api/movies_api.dart';

class MovieImplementation extends MovieRepository {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final results = await MoviesApi.getMoviesByCategory('now_playing');
    return results;
  }

  @override
  Future<List<MovieModel>> getLatestMovies() async {
    final results = await MoviesApi.getMoviesByCategory('latest');
    return results;
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final results = await MoviesApi.getMoviesByCategory('popular');
    return results;
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final results = await MoviesApi.getMoviesByCategory('top_rated');
    return results;
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final results = await MoviesApi.getMoviesByCategory('trending');
    return results;
  }

  @override
  Future<MovieModel> getMovieDetails(String id) async {
    final movie = await MoviesApi.getMovieDetails(id);

    return movie!;
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Cast>> getMovieCast(String id) async {
    final casts = await MoviesApi.getMovieCasts(id);
    print(casts.length);
    return casts;
  }
}
