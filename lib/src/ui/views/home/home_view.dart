import 'dart:async';

import 'package:app_cinema/src/data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_cinema/src/ui/utils/responsive.dart';
import 'package:app_cinema/src/ui/views/home/widgets/movie_image.dart';
import 'package:app_cinema/src/ui/views/home/widgets/background_movie_image.dart';

import '../movies_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<MovieModel>> _popularMoviesFuture;
  late Future<List<MovieModel>> _playingNowMoviesFuture;
  late Future<List<MovieModel>> _topRatedMoviesFuture;
  late Timer _timer;
  List<MovieModel> _popularMovies = [];

  @override
  void initState() {
    super.initState();

    final provider = context.read<MoviesProvider>();
    provider.homePageCtrl = PageController(viewportFraction: 0.9);
    _popularMoviesFuture = provider.getMovies('popular');
    _playingNowMoviesFuture = provider.getMovies('playing_now');
    _topRatedMoviesFuture = provider.getMovies('top_rated');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final provider = context.read<MoviesProvider>();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick % 5 == 0) {
        final int currentPage = provider.homePageCtrl.page!.toInt();

        (_popularMovies.length - 1 == currentPage)
            ? provider.animateTo(0)
            : provider.animateTo(currentPage + 1);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    context.read<MoviesProvider>().dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.movie_outlined),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: responsive.hp(2),
              horizontal: responsive.wp(2),
            ),
            child: Text(
              'Popular',
              style: TextStyle(
                fontSize: responsive.dp(2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: responsive.hp(30),
            width: responsive.width,
            child: FutureBuilder(
              future: _popularMoviesFuture,
              builder: (_, AsyncSnapshot<List<MovieModel>> snapshot) {
                if (snapshot.hasData) {
                  final movies = snapshot.data!;
                  _popularMovies = movies;
                  return PageView.builder(
                    itemCount: movies.length,
                    controller: context.read<MoviesProvider>().homePageCtrl,
                    itemBuilder: (_, index) {
                      final movie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            height: responsive.hp(30),
                            width: responsive.width,
                            child: BackgroundMovieImage(movie),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: responsive.hp(2),
              horizontal: responsive.wp(2),
            ),
            child: Text(
              'Playing now',
              style: TextStyle(
                fontSize: responsive.dp(2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: responsive.hp(30),
            width: responsive.width,
            child: FutureBuilder(
              future: _playingNowMoviesFuture,
              builder: (_, AsyncSnapshot<List<MovieModel>> snapshot) {
                if (snapshot.hasData) {
                  final movies = snapshot.data!;
                  return ListView.builder(
                    itemCount: movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final movie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MovieImage(
                          movie,
                          height: responsive.hp(30),
                          width: responsive.wp(35),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: responsive.hp(2),
              horizontal: responsive.wp(2),
            ),
            child: Text(
              'Top 10',
              style: TextStyle(
                fontSize: responsive.dp(2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: responsive.hp(30),
            width: responsive.width,
            child: FutureBuilder(
              future: _topRatedMoviesFuture,
              builder: (_, AsyncSnapshot<List<MovieModel>> snapshot) {
                if (snapshot.hasData) {
                  final movies = snapshot.data!;
                  return ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final movie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Stack(
                          children: [
                            ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Colors.black26,
                                BlendMode.darken,
                              ),
                              child: MovieImage(
                                movie,
                                height: responsive.hp(30),
                                width: responsive.wp(35),
                              ),
                            ),
                            Positioned(
                              right: -15,
                              bottom: -25,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: responsive.dp(12),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
