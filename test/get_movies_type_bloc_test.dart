import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/get_movies_type.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_movies_type/get_movies_type_bloc.dart';

class MockGetMoviesTypeUseCase extends Mock implements GetMoviesTypeUseCase {}

void main() {
  late MockGetMoviesTypeUseCase mockGetMoviesTypeUseCase;
  late GetMoviesTypeBloc getMoviesTypeBloc;

  setUp(() {
    mockGetMoviesTypeUseCase = MockGetMoviesTypeUseCase();
    getMoviesTypeBloc = GetMoviesTypeBloc(mockGetMoviesTypeUseCase);
  });

  group('GetMoviesTypeBloc', () {
    const String movieType = "popular";
    final List<Movie> mockMovies = [
      Movie(id: 1, title: "Movie 1", posterPath: "/path1.jpg", voteAverage: 8.5),
      Movie(id: 2, title: "Movie 2", posterPath: "/path2.jpg", voteAverage: 7.8),
    ];

    test('Initial state is GetMoviesTypeLoading', () {
      expect(getMoviesTypeBloc.state, isA<GetMoviesTypeLoading>());
    });

    blocTest<GetMoviesTypeBloc, GetMoviesTypeState>(
      'Emits [GetMoviesTypeLoading, GetMoviesTypeSuccess] when OnGetMoviesType succeeds',
      build: () {
        when(() => mockGetMoviesTypeUseCase(movieType))
            .thenAnswer((_) async => Right(mockMovies));
        return getMoviesTypeBloc;
      },
      act: (bloc) => bloc.add(OnGetMoviesType(type: movieType)),
      expect: () => [
        isA<GetMoviesTypeSuccess>().having(
          (state) => state.movies,
          'movies',
          mockMovies,
        ),
      ],
    );

    blocTest<GetMoviesTypeBloc, GetMoviesTypeState>(
      'Emits [GetMoviesTypeLoading, GetMoviesTypeFailure] when OnGetMoviesType fails',
      build: () {
        when(() => mockGetMoviesTypeUseCase(movieType))
            .thenAnswer((_) async => Left(ServerFailure()));
        return getMoviesTypeBloc;
      },
      act: (bloc) => bloc.add(OnGetMoviesType(type: movieType)),
      expect: () => [
        isA<GetMoviesTypeFailure>().having(
          (state) => state.failure,
          'failure',
          isA<ServerFailure>(),
        ),
      ],
    );
  });
}
