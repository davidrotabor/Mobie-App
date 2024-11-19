part of 'get_movie_credits_bloc.dart';

sealed class GetMovieCreditsEvent {}

class OnGetMovieCredits extends GetMovieCreditsEvent {
  final int id;

  OnGetMovieCredits({required this.id});
}

class OnDeleteCredits extends GetMovieCreditsEvent {
  OnDeleteCredits();
}
