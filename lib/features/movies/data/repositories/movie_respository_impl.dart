import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/data/datasources/movies_data_source.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_credits.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_details.dart';
import 'package:prueba_tecnica/features/movies/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesDataSource moviesDataSource;

  MovieRepositoryImpl({required this.moviesDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getMovies(String type) async {
    try {
      final List<Movie> movies = await moviesDataSource.getMovies(type);
      return Right(movies);
    } on DioException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String text) async {
    try {
      final List<Movie> movies = await moviesDataSource.searchMovies(text);
      return Right(movies);
    } on DioException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) async {
    try {
      final MovieDetails movieDetails =
          await moviesDataSource.getMovieDetails(id);
      return Right(movieDetails);
    } on DioException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieCredit>>> getMovieCredits(int id) async {
    try {
      final List<MovieCredit> credits = await moviesDataSource.getMovieCredits(id);
      return Right(credits);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}
