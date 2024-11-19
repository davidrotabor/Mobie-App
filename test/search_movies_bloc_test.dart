import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/search_movies.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/search_movies/search_movies_bloc.dart';

class MockSearchMoviesUseCase extends Mock implements SearchMoviesUseCase {}

void main() {
  late MockSearchMoviesUseCase mockSearchMoviesUseCase;
  late SearchMoviesBloc searchMoviesBloc;

  setUp(() {
    mockSearchMoviesUseCase = MockSearchMoviesUseCase();
    searchMoviesBloc = SearchMoviesBloc(mockSearchMoviesUseCase);
  });

  group('SearchMoviesBloc', () {
    const String query = "Inception";
    final List<Movie> mockMovies = [
      Movie(id: 1, title: "Inception", posterPath: '', voteAverage: 0),
      Movie(id: 2, title: "Interstellar", posterPath: '', voteAverage: 0),
    ];

    test('Initial state is NotSearchMovies', () {
      expect:
      () => [isA<NotSearchMovies>()];
    });

    blocTest<SearchMoviesBloc, SearchMoviesState>(
        'Emits [SearchMoviesLoading, SearchMoviesSuccess] when OnSearchMovies succeeds',
        build: () {
          when(() => mockSearchMoviesUseCase(query))
              .thenAnswer((_) async => Right(mockMovies));
          return searchMoviesBloc;
        },
        act: (bloc) => bloc.add(OnSearchMovies(text: query)),
        expect: () => [isA<SearchMoviesSuccess>()]);

    blocTest<SearchMoviesBloc, SearchMoviesState>(
        'Emits [SearchMoviesLoading, SearchMoviesFailure] when OnSearchMovies fails',
        build: () {
          when(() => mockSearchMoviesUseCase(query))
              .thenAnswer((_) async => Left(ServerFailure()));
          return searchMoviesBloc;
        },
        act: (bloc) => bloc.add(OnSearchMovies(text: query)),
        expect: () => [isA<SearchMoviesFailure>()]);

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'Emits [NotSearchMovies] when OnDeleteSearchMovies is added',
      build: () => searchMoviesBloc,
      act: (bloc) => bloc.add(OnDeleteSearchMovies()),
      expect: () => [isA<NotSearchMovies>()]);
  });
}
