import 'package:app_cinema/src/data/models/movie_model.dart';
import 'package:flutter/material.dart';

import 'package:app_cinema/src/domain/entities/cast.dart';
import 'package:app_cinema/src/domain/repositories/movie_repository.dart';

class MoviesProvider with ChangeNotifier {
  MoviesProvider({required this.movieRepository});
  final MovieRepository movieRepository;

  late PageController homePageCtrl;

  Future<void> animateTo(int page) async {
    await homePageCtrl.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  Future<List<Cast>> getMovieCast(String id) async {
    return await movieRepository.getMovieCast(id);
  }

  Future<List<MovieModel>> getMovies(String category) async {
    switch (category) {
      case 'popular':
        return await movieRepository.getPopularMovies();
      case 'top_rated':
        return await movieRepository.getTopRatedMovies();
      case 'trending':
        return await movieRepository.getTrendingMovies();
      case 'lastest':
        return await movieRepository.getLatestMovies();
      case 'now_playing':
        return await movieRepository.getNowPlayingMovies();
      default:
        return await movieRepository.getPopularMovies();
    }
  }
}
