import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_credits.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/get_movie_credits.dart';

part 'get_movie_credits_event.dart';

part 'get_movie_credits_state.dart';

class GetMovieCreditsBloc
    extends Bloc<GetMovieCreditsEvent, GetMovieCreditsState> {
  final GetMovieCreditsUseCase _getMovieCreditsUseCase;

  GetMovieCreditsBloc(this._getMovieCreditsUseCase)
      : super(GetMovieCreditsLoading()) {
    on<OnGetMovieCredits>((event, emit) async {
      final response = await _getMovieCreditsUseCase(event.id);

      response.fold(
          (failure) => emit(GetMovieCreditsFailure(failure: failure)),
          (movieCredits) =>
              emit(GetMovieCreditsSuccess(movieCredits: movieCredits)));
    });

    on<OnDeleteCredits>((event, emit) async {
      emit(GetMovieCreditsLoading());
    });
  }
}
