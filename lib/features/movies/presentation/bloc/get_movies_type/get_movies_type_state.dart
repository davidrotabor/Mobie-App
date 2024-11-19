part of 'get_movies_type_bloc.dart';

sealed class GetMoviesTypeState {}

final class GetMoviesTypeLoading extends GetMoviesTypeState {}

final class GetMoviesTypeSuccess extends GetMoviesTypeState {
  final List<Movie> movies;

  GetMoviesTypeSuccess({required this.movies});
}

final class GetMoviesTypeFailure extends GetMoviesTypeState {
  final Failure failure;

  GetMoviesTypeFailure({required this.failure});
}
