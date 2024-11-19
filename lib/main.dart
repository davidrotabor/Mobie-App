import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica/config/constants/themes/data/AppTheme.dart';
import 'package:prueba_tecnica/config/constants/themes/presentation/theme_bloc.dart';
import 'package:prueba_tecnica/di.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_credits/get_movie_credits_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_details/get_movie_details_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'config/constants/environment.dart';
import 'features/movies/presentation/screens/movies_search_screen.dart';

Future<void> main() async {
  await Environment.initEnvironment();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance.get<SearchMoviesBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<GetMovieDetailsBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<GetMovieCreditsBloc>())
      ],
      child: BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeMode>(
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state,
            home: const MoviesSearchScreen(),
          ),
        ),
      ),
    );
  }
}
