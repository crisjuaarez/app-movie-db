import 'package:app_cinema/src/data/models/movie_model.dart';
import 'package:flutter/material.dart';

import 'package:app_cinema/src/ui/widgets/my_network_image.dart';

class BackgroundMovieImage extends StatelessWidget {
  const BackgroundMovieImage(this.movie, {Key? key}) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.black12,
        BlendMode.darken,
      ),
      child: MyNetworkImage(
        movie.getBackdropPath,
        height: double.infinity,
      ),
    );
  }
}
