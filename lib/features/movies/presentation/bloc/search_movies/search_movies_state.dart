part of 'search_movies_bloc.dart';

sealed class SearchMoviesState {}

final class SearchMoviesLoading extends SearchMoviesState {}

final class NotSearchMovies extends SearchMoviesState {}

final class SearchMoviesSuccess extends SearchMoviesState {
  final List<Movie> movies;

  SearchMoviesSuccess({required this.movies});
}

final class SearchMoviesFailure extends SearchMoviesState {
  final Failure failure;

  SearchMoviesFailure({required this.failure});
}
