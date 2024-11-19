part of 'get_movie_credits_bloc.dart';

sealed class GetMovieCreditsState {}

final class GetMovieCreditsLoading extends GetMovieCreditsState {}

final class GetMovieCreditsSuccess extends GetMovieCreditsState {
  final List<MovieCredit> movieCredits;

  GetMovieCreditsSuccess({required this.movieCredits});
}

final class GetMovieCreditsFailure extends GetMovieCreditsState {
  final Failure failure;

  GetMovieCreditsFailure({required this.failure});
}
