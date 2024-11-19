part of 'get_movies_type_bloc.dart';

sealed class GetMoviesTypeEvent {}

class OnGetMoviesType extends GetMoviesTypeEvent {
  final String type;

  OnGetMoviesType({required this.type});
}
