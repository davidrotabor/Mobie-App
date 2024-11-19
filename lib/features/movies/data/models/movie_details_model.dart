import 'package:prueba_tecnica/features/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.overview,
    required super.productionCompanies,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      genres: (json['genres'] as List)
          .map((genreJson) => Genre.fromJson(genreJson))
          .toList(),
      overview: json['overview'],
      productionCompanies: (json['production_companies'] as List)
          .map((companyJson) => ProductionCompany.fromJson(companyJson))
          .toList(),
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
