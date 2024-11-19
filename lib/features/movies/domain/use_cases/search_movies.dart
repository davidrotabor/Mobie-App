import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:prueba_tecnica/features/movies/domain/repositories/movies_repository.dart';

class SearchMoviesUseCase {
  final MovieRepository repository;

  SearchMoviesUseCase({required this.repository});

  Future<Either<Failure, List<Movie>>> call(String text) {
    return repository.searchMovies(text);
  }
}
