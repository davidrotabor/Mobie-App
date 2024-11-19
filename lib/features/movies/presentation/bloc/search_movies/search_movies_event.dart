part of 'search_movies_bloc.dart';

sealed class SearchMoviesEvent {}

class OnSearchMovies extends SearchMoviesEvent {
  final String text;

  OnSearchMovies({required this.text});
}

class OnDeleteSearchMovies extends SearchMoviesEvent {
  OnDeleteSearchMovies();
}
