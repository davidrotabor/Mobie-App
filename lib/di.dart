import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica/config/constants/themes/presentation/theme_bloc.dart';
import 'package:prueba_tecnica/features/movies/data/datasources/movies_data_source.dart';
import 'package:prueba_tecnica/features/movies/data/repositories/movie_respository_impl.dart';
import 'package:prueba_tecnica/features/movies/domain/repositories/movies_repository.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/get_movie_credits.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/get_movie_details.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/get_movies_type.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/search_movies.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_credits/get_movie_credits_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_details/get_movie_details_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_movies_type/get_movies_type_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/search_movies/search_movies_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC's
  sl.registerFactory(
    () => GetMoviesTypeBloc(
      sl(),
    ),
  );

  sl.registerFactory(
    () => SearchMoviesBloc(
      sl(),
    ),
  );
  sl.registerFactory(
    () => GetMovieDetailsBloc(
      sl(),
    ),
  );

  sl.registerFactory(
    () => GetMovieCreditsBloc(
      sl(),
    ),
  );

  sl.registerFactory(
    () => ThemeBloc(),
  );

  // Use cases
  sl.registerLazySingleton(() => GetMoviesTypeUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetMovieCreditsUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(moviesDataSource: sl()));

  // Datasources
  sl.registerLazySingleton<MoviesDataSource>(() => MovieDataSourceImpl());
}
