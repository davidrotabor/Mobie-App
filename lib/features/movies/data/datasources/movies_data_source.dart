import 'package:dio/dio.dart';
import 'package:prueba_tecnica/config/constants/environment.dart';
import 'package:prueba_tecnica/features/movies/data/models/movie_credits.dart';
import 'package:prueba_tecnica/features/movies/data/models/movie_details_model.dart';
import 'package:prueba_tecnica/features/movies/data/models/movie_model.dart';

abstract class MoviesDataSource {
  Future<List<MovieModel>> getMovies(String type);

  Future<List<MovieModel>> searchMovies(String text);

  Future<MovieDetailsModel> getMovieDetails(int id);

  Future<List<CreditModel>> getMovieCredits(int id);
}

class MovieDataSourceImpl implements MoviesDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiMoviesUrl,
      queryParameters: {
        "language": Environment.apiMoviesLanguage,
        "api_key": Environment.apiMoviesKey
      },
    ),
  );

  @override
  Future<List<MovieModel>> getMovies(String type) async {
    final response = await dio.get('/movie/$type');
    List<MovieModel> movies = (response.data['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();
    return movies;
  }

  @override
  Future<List<MovieModel>> searchMovies(String text) async {
    final response =
        await dio.get('/search/movie', queryParameters: {'query': text});
    List<MovieModel> movies = (response.data['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();
    return movies;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final response = await dio.get('/movie/$id');
    return MovieDetailsModel.fromJson(response.data);
  }

  @override
  Future<List<CreditModel>> getMovieCredits(int id) async {
    final response = await dio.get('/movie/$id/credits');
    List<CreditModel> credits = (response.data['cast'] as List)
        .map((credit) => CreditModel.fromJson(credit))
        .toList();
    return credits;
  }
}
