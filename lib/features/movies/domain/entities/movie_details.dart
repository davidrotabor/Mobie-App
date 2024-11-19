class MovieDetails {
  final String? backdropPath;
  final List<Genre> genres;
  final String overview;
  final List<ProductionCompany> productionCompanies;
  final String releaseDate;
  final String title;
  final double voteAverage;

  MovieDetails({
    this.backdropPath,
    required this.genres,
    required this.overview,
    required this.productionCompanies,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });
}

class Genre {
  final String name;

  Genre({required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      name: json['name'],
    );
  }
}

class ProductionCompany {
  final String name;

  ProductionCompany({
    required this.name,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      name: json['name'],
    );
  }
}

class ProductionCountry {
  final String name;

  ProductionCountry({required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      name: json['name'],
    );
  }
}
