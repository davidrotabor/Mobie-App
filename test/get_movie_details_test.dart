import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_details.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/get_movie_details.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_details/get_movie_details_bloc.dart';

class MockGetMovieDetailsUseCase extends Mock implements GetMovieDetailsUseCase {}

void main() {
  late MockGetMovieDetailsUseCase mockGetMovieDetailsUseCase;
  late GetMovieDetailsBloc getMovieDetailsBloc;

  setUp(() {
    mockGetMovieDetailsUseCase = MockGetMovieDetailsUseCase();
    getMovieDetailsBloc = GetMovieDetailsBloc(mockGetMovieDetailsUseCase);
  });

  group('GetMovieDetailsBloc', () {
    const int movieId = 1; // ID de la película que queremos obtener.
    final MovieDetails mockMovieDetails = MovieDetails(
      title: "Inception",
      overview: "A thief with the ability to enter people's dreams...",
      voteAverage: 8.8,
      releaseDate: "2010-07-16", genres: [], productionCompanies: [],
    );

    test('Initial state is GetMovieDetailsLoading', () {
      expect(getMovieDetailsBloc.state, isA<GetMovieDetailsLoading>());
    });

    blocTest<GetMovieDetailsBloc, GetMovieDetailsState>(
      'Emits [GetMovieDetailsLoading, GetMovieDetailsSuccess] when OnGetMovieDetails succeeds',
      build: () {
        when(() => mockGetMovieDetailsUseCase(movieId))
            .thenAnswer((_) async => Right(mockMovieDetails)); // Simula éxito.
        return getMovieDetailsBloc;
      },
      act: (bloc) => bloc.add(OnGetMovieDetails(id: movieId)),
      expect: () => [
        isA<GetMovieDetailsSuccess>().having(
              (state) => state.movie,
          'movie',
          mockMovieDetails,
        ),
      ],
    );

    blocTest<GetMovieDetailsBloc, GetMovieDetailsState>(
      'Emits [GetMovieDetailsLoading, GetMovieDetailsFailure] when OnGetMovieDetails fails',
      build: () {
        when(() => mockGetMovieDetailsUseCase(movieId))
            .thenAnswer((_) async => Left(ServerFailure())); // Simula fallo.
        return getMovieDetailsBloc;
      },
      act: (bloc) => bloc.add(OnGetMovieDetails(id: movieId)),
      expect: () => [
        isA<GetMovieDetailsFailure>().having(
              (state) => state.failure,
          'failure',
          isA<ServerFailure>(),
        ),
      ],
    );

    blocTest<GetMovieDetailsBloc, GetMovieDetailsState>(
      'Emits [GetMovieDetailsLoading] when OnDeleteDetails is added',
      build: () => getMovieDetailsBloc,
      act: (bloc) => bloc.add(OnDeleteDetails()), // Reinicia el estado.
      expect: () => [isA<GetMovieDetailsLoading>()],
    );
  });
}
