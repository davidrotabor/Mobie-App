import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_credits.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/get_movie_credits.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_credits/get_movie_credits_bloc.dart';

class MockGetMovieCreditsUseCase extends Mock implements GetMovieCreditsUseCase {}

void main() {
  late MockGetMovieCreditsUseCase mockGetMovieCreditsUseCase;
  late GetMovieCreditsBloc getMovieCreditsBloc;

  setUp(() {
    mockGetMovieCreditsUseCase = MockGetMovieCreditsUseCase();
    getMovieCreditsBloc = GetMovieCreditsBloc(mockGetMovieCreditsUseCase);
  });

  group('GetMovieCreditsBloc', () {
    const int movieId = 1;
    final List<MovieCredit> mockMovieCredits = [
      MovieCredit(
        originalName: "Leonardo DiCaprio",
        profilePath: "/leonardo.jpg",
      ),
      MovieCredit(
        originalName: "Joseph Gordon-Levitt",
        profilePath: "/joseph.jpg",
      ),
    ];

    test('Initial state is GetMovieCreditsLoading', () {
      expect(getMovieCreditsBloc.state, isA<GetMovieCreditsLoading>());
    });

    blocTest<GetMovieCreditsBloc, GetMovieCreditsState>(
      'Emits [GetMovieCreditsLoading, GetMovieCreditsSuccess] when OnGetMovieCredits succeeds',
      build: () {
        when(() => mockGetMovieCreditsUseCase(movieId))
            .thenAnswer((_) async => Right(mockMovieCredits));
        return getMovieCreditsBloc;
      },
      act: (bloc) => bloc.add(OnGetMovieCredits(id: movieId)),
      expect: () => [
        isA<GetMovieCreditsSuccess>().having(
              (state) => state.movieCredits,
          'movieCredits',
          mockMovieCredits,
        ),
      ],
    );

    blocTest<GetMovieCreditsBloc, GetMovieCreditsState>(
      'Emits [GetMovieCreditsLoading, GetMovieCreditsFailure] when OnGetMovieCredits fails',
      build: () {
        when(() => mockGetMovieCreditsUseCase(movieId))
            .thenAnswer((_) async => Left(ServerFailure()));
        return getMovieCreditsBloc;
      },
      act: (bloc) => bloc.add(OnGetMovieCredits(id: movieId)),
      expect: () => [
        isA<GetMovieCreditsFailure>().having(
              (state) => state.failure,
          'failure',
          isA<ServerFailure>(),
        ),
      ],
    );

    blocTest<GetMovieCreditsBloc, GetMovieCreditsState>(
      'Emits [GetMovieCreditsLoading] when OnDeleteCredits is added',
      build: () => getMovieCreditsBloc,
      act: (bloc) => bloc.add(OnDeleteCredits()),
      expect: () => [isA<GetMovieCreditsLoading>()],
    );
  });
}
