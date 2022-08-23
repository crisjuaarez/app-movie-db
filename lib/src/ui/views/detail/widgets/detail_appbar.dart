import 'package:flutter/material.dart';

import 'package:app_cinema/src/domain/entities/movie.dart';
import 'package:app_cinema/src/ui/theme/app_colors.dart';
import 'package:app_cinema/src/ui/utils/responsive.dart';
import 'package:app_cinema/src/ui/widgets/circular_icon.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        children: [
          CircularIcon(
            icon: Icons.chevron_left,
            onTap: () => Navigator.maybePop(context),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                // Text(
                //   '${movie.title} · ',
                //   style: TextStyle(
                //     fontSize: responsive.dp(2),
                //     color: Colors.white,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                Row(
                  children: [
                    Text(
                      '${movie.releaseDate}',
                      style: TextStyle(
                        fontSize: responsive.dp(2),
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.yellow,
                      size: responsive.dp(2.5),
                    ),
                  ],
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
