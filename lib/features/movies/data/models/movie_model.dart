import 'package:prueba_tecnica/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.posterPath,
    required super.title,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(json) {
    return MovieModel(
      id: json['id'],
      posterPath: json['poster_path'],
      title: json['title'],
      voteAverage: json['vote_average'],
    );
  }
}
