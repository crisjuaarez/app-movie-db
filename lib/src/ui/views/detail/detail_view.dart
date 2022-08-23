import 'package:app_cinema/src/data/models/movie_model.dart';
import 'package:flutter/material.dart';

import 'package:app_cinema/src/ui/utils/router.dart';
import 'package:app_cinema/src/ui/utils/responsive.dart';
import 'package:app_cinema/src/ui/theme/app_colors.dart';
import 'package:app_cinema/src/ui/views/cast/cast_view.dart';
import 'package:app_cinema/src/ui/widgets/circular_icon.dart';
import 'package:app_cinema/src/ui/views/home/widgets/movie_image.dart';
import 'package:app_cinema/src/ui/views/home/widgets/background_movie_image.dart';

import 'widgets/seats_and_button.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    print(widget.movie.id);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            elevation: 0,
            backgroundColor: AppColors.backgroundColor,
            leading: CircularIcon(
              icon: Icons.chevron_left,
              onTap: () => Navigator.maybePop(context),
            ),
            expandedHeight: responsive.hp(50),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(1),
                ),
                child: Text(
                  widget.movie.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: responsive.dp(1.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              expandedTitleScale: 2,
              background: BackgroundMovieImage(widget.movie),
            ),
            actions: [
              CircularIcon(
                icon: Icons.star_border_rounded,
                onTap: () => MyRouter.goTo(
                  context,
                  CastView(id: widget.movie.id.toString()),
                ),
              ),
            ],
          ),
        ],
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.wp(4),
            vertical: responsive.hp(2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: responsive.hp(2)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieImage(
                    widget.movie,
                    height: responsive.hp(30),
                    width: responsive.wp(35),
                  ),
                  SizedBox(width: responsive.wp(2)),
                  Expanded(
                    child: Text(
                      widget.movie.overview,
                      maxLines: 11,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: responsive.dp(2)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsive.hp(2)),
              SeatsAndButton(movie: widget.movie),
            ],
          ),
        ),
      ),
    );
    // body: SafeArea(
    //   child: SizedBox(
    //     height: responsive.height,
    //     width: responsive.width,
    //     child: SingleChildScrollView(
    //       padding: EdgeInsets.symmetric(
    //         horizontal: responsive.wp(4),
    //       ),
    //       child: Column(
    //         children: [
    //           DetailAppBar(movie: movie),
    //           SizedBox(height: responsive.hp(2)),
    //           Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Expanded(
    //                     child: MovieImage(
    //                       movie,
    //                       height: responsive.hp(30),
    //                       width: responsive.wp(40),
    //                     ),
    //                   ),
    //                   SizedBox(width: responsive.wp(4)),
    //                   Expanded(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           movie.title,
    //                           style: TextStyle(
    //                             color: Colors.white,
    //                             fontSize: responsive.dp(2.5),
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                         SizedBox(height: responsive.hp(1)),
    //                         Text(
    //                           movie.overview,
    //                           maxLines: 10,
    //                           overflow: TextOverflow.ellipsis,
    //                           style: TextStyle(
    //                             color: Colors.white,
    //                             fontSize: responsive.dp(1.75),
    //                             fontWeight: FontWeight.w400,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(height: responsive.hp(2)),
    //               SeatsAndButton(movie: movie),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // );
  }
}
