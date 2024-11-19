part of 'get_movie_details_bloc.dart';

sealed class GetMovieDetailsEvent {}

class OnGetMovieDetails extends GetMovieDetailsEvent {
  final int id;

  OnGetMovieDetails({required this.id});
}

class OnDeleteDetails extends GetMovieDetailsEvent {
  OnDeleteDetails();
}
