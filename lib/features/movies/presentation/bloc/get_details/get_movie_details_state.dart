part of 'get_movie_details_bloc.dart';

sealed class GetMovieDetailsState {}

final class GetMovieDetailsLoading extends GetMovieDetailsState {}

final class GetMovieDetailsSuccess extends GetMovieDetailsState {
  final MovieDetails movie;

  GetMovieDetailsSuccess({required this.movie});
}

final class GetMovieDetailsFailure extends GetMovieDetailsState {
  final Failure failure;

  GetMovieDetailsFailure({required this.failure});
}
