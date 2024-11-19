import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_details.dart';
import 'package:prueba_tecnica/features/movies/domain/repositories/movies_repository.dart';

class GetMovieDetailsUseCase {
  final MovieRepository repository;

  GetMovieDetailsUseCase({required this.repository});

  Future<Either<Failure, MovieDetails>> call(int id) {
    return repository.getMovieDetails(id);
  }
}
