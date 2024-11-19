import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  static const String _notFound = 'Environment variable not found';

  static String apiMoviesUrl = dotenv.env['API_MOVIES_URL'] ?? '$_notFound: API_MOVIES_URL';
  static String apiMoviesKey = dotenv.env['API_MOVIES_KEY'] ?? '$_notFound: API_MOVIES_KEY';
  static String apiMoviesLanguage = dotenv.env['API_MOVIES_LANGUAGE'] ?? '$_notFound: API_MOVIES_LANGUAGE';
  static String apiImagesUrl = dotenv.env['API_IMAGES_URL'] ?? '$_notFound: API_IMAGES_URL';
}