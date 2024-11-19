import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_credits.dart';
import 'package:prueba_tecnica/features/movies/domain/repositories/movies_repository.dart';

class GetMovieCreditsUseCase {
  final MovieRepository repository;

  GetMovieCreditsUseCase({required this.repository});

  Future<Either<Failure, List<MovieCredit>>> call(int id) {
    return repository.getMovieCredits(id);
  }
}
