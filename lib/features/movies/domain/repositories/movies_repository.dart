import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_credits.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_details.dart';

abstract class MovieRepository {

  Future<Either<Failure, List<Movie>>> getMovies(String type);
  Future<Either<Failure, List<Movie>>> searchMovies(String text);
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id);
  Future<Either<Failure, List<MovieCredit>>> getMovieCredits(int id);
}