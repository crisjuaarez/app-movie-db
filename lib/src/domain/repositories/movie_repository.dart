import 'package:app_cinema/src/data/models/movie_model.dart';
import 'package:app_cinema/src/domain/entities/cast.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getLatestMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> searchMovies(String query);
  Future<MovieModel> getMovieDetails(String id);
  Future<List<Cast>> getMovieCast(String id);
}
