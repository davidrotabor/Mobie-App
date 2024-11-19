import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/config/constants/themes/data/CustomColors.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/widgets/list_movies_type.dart';
import 'package:prueba_tecnica/features/movies/presentation/widgets/movie_poster.dart';

class MoviesModal extends StatelessWidget {
  const MoviesModal({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: customColors?.backgroundModalColor ?? Color(0xff000),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
            builder: (context, state) {
              switch (state) {
                case SearchMoviesLoading():
                  return const Center(child: CircularProgressIndicator());
                case NotSearchMovies():
                  return ListMoviesType(
                    scrollController: scrollController,
                  );
                case SearchMoviesSuccess():
                  return GridView.count(
                    controller: scrollController,
                    crossAxisCount: 2,
                    childAspectRatio: 0.53,
                    crossAxisSpacing: 20,
                    padding: const EdgeInsets.only(left: 35),
                    mainAxisSpacing: 0,
                    children: List.generate(
                      state.movies.length,
                      (index) {
                        return MoviePoster(movie: state.movies[index]);
                      },
                    ),
                  );
                case SearchMoviesFailure():
                  return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }
}
