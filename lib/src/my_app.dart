import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/theme/app_colors.dart';
import 'ui/views/home/home_view.dart';
import 'ui/views/movies_provider.dart';
import 'data/repository/movie_implementation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MoviesProvider(
        movieRepository: MovieImplementation(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cinema App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
        home: const HomeView(),
      ),
    );
  }
}
