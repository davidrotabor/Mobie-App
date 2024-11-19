import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/search_movies.dart';

part 'search_movies_event.dart';

part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMoviesUseCase _searchMoviesUseCase;

  SearchMoviesBloc(this._searchMoviesUseCase) : super(NotSearchMovies()) {
    on<OnSearchMovies>((event, emit) async {
      final response = await _searchMoviesUseCase(event.text);

      response.fold((failure) => emit(SearchMoviesFailure(failure: failure)),
          (movies) => emit(SearchMoviesSuccess(movies: movies)));
    });

    on<OnDeleteSearchMovies>((event, emit) async {
      emit(NotSearchMovies());
    });
  }
}
