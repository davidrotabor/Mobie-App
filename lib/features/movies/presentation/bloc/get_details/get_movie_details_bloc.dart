import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie_details.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/get_movie_details.dart';

part 'get_movie_details_event.dart';

part 'get_movie_details_state.dart';

class GetMovieDetailsBloc
    extends Bloc<GetMovieDetailsEvent, GetMovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  GetMovieDetailsBloc(this._getMovieDetailsUseCase)
      : super(GetMovieDetailsLoading()) {
    on<OnGetMovieDetails>((event, emit) async {
      final response = await _getMovieDetailsUseCase(event.id);

      response.fold((failure) => emit(GetMovieDetailsFailure(failure: failure)),
          (movie) => emit(GetMovieDetailsSuccess(movie: movie)));
    });

    on<OnDeleteDetails>((event, emit) async {
      emit(GetMovieDetailsLoading());
    });
  }
}
