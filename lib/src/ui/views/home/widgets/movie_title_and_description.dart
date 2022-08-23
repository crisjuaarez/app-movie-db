import 'package:flutter/material.dart';

import 'package:app_cinema/src/domain/entities/movie.dart';
import 'package:app_cinema/src/ui/utils/responsive.dart';

class MovieTitleAndDescription extends StatelessWidget {
  const MovieTitleAndDescription({Key? key, required this.movie})
      : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Column(
      children: [
        Text(
          movie.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: responsive.dp(3.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        Text(
          movie.originalLanguage,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: responsive.dp(2),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
