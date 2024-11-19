import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/core/error/failures.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:prueba_tecnica/features/movies/domain/use_cases/get_movies_type.dart';

part 'get_movies_type_event.dart';

part 'get_movies_type_state.dart';

class GetMoviesTypeBloc extends Bloc<GetMoviesTypeEvent, GetMoviesTypeState> {
  final GetMoviesTypeUseCase _getMoviesTypeUseCase;

  GetMoviesTypeBloc(this._getMoviesTypeUseCase)
      : super(GetMoviesTypeLoading()) {
    on<OnGetMoviesType>((event, emit) async {
      final response = await _getMoviesTypeUseCase(event.type);

      response.fold((failure) => emit(GetMoviesTypeFailure(failure: failure)),
          (movies) => emit(GetMoviesTypeSuccess(movies: movies)));
    });
  }
}
