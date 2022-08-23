import 'package:app_cinema/src/data/models/movie_model.dart';
import 'package:flutter/material.dart';

import 'package:app_cinema/src/ui/utils/router.dart';
import 'package:app_cinema/src/ui/views/detail/detail_view.dart';
import 'package:app_cinema/src/ui/widgets/my_network_image.dart';

class MovieImage extends StatelessWidget {
  const MovieImage(
    this.movie, {
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final MovieModel movie;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MyRouter.goTo(context, DetailView(movie: movie)),
      child: Hero(
        tag: movie.posterPath,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              MyNetworkImage(
                movie.getPosterPath,
                height: height,
                width: width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
