import 'package:prueba_tecnica/features/movies/domain/entities/movie_credits.dart';

class CreditModel extends MovieCredit {
  CreditModel({
    required super.originalName,
    required super.profilePath,
  });

  factory CreditModel.fromJson(json) {
    return CreditModel(
      originalName: json['original_name'],
      profilePath: json['profile_path'] ?? '',
    );
  }
}
