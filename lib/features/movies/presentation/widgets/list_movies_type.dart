import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica/config/constants/themes/data/CustomColors.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_movies_type/get_movies_type_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/widgets/movie_poster.dart';

class ListMoviesType extends StatelessWidget {

  List<Map<String, String>> sections = [
    {'title': 'RECOMMENDED FOR YOU', 'code': 'popular'},
    {'title': 'TOP RATED', 'code': 'top_rated'}
  ];

  final ScrollController scrollController;

  ListMoviesType({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      itemCount: sections.length,
      padding: const EdgeInsets.only(top: 20, left: 25),
      itemBuilder: (context, index) =>
          BlocProvider(
            create: (BuildContext context) =>
                GetIt.instance.get<GetMoviesTypeBloc>(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sections[index]['title'] ?? '',
                      style: TextStyle(
                          color: customColors!.textTitleColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.7),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: customColors.backgroundButtonColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<GetMoviesTypeBloc, GetMoviesTypeState>(
                    builder: (context, state) {
                      switch (state) {
                        case GetMoviesTypeLoading():
                          BlocProvider.of<GetMoviesTypeBloc>(context)
                              .add(OnGetMoviesType(
                            type: sections[index]['code'] ?? '',));
                          return const Center(
                              child: CircularProgressIndicator());
                        case GetMoviesTypeSuccess():
                          return SizedBox(
                            height: 270,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.movies.length,
                              itemBuilder: (context, index) =>
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: MoviePoster(
                                        movie: state.movies[index]),
                                  ),
                            ),
                          );
                        case GetMoviesTypeFailure():
                          return const Center(
                              child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ),
    );
  }
}
