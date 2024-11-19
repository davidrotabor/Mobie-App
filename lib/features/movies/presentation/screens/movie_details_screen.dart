import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/config/constants/environment.dart';
import 'package:prueba_tecnica/config/constants/themes/data/CustomColors.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_details/get_movie_details_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/widgets/credits_poster.dart';
import 'package:prueba_tecnica/features/movies/presentation/widgets/row_details_list.dart';
import 'package:prueba_tecnica/features/movies/presentation/widgets/star_rating.dart';


class MovieDetails extends StatelessWidget {
  final int movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          color: const Color.fromRGBO(255, 255, 255, 0.75),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.heart_broken_rounded),
            color: const Color.fromRGBO(255, 255, 255, 0.75),
            onPressed: () {
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: customColors!.backgroundModalColor,
      body: BlocBuilder<GetMovieDetailsBloc, GetMovieDetailsState>(
        builder: (context, state) {
          switch (state) {
            case GetMovieDetailsLoading():
              return const Center(child: CircularProgressIndicator());
            case GetMovieDetailsSuccess():
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        '${Environment.apiImagesUrl}/w500${state.movie.backdropPath}',
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.movie.title,
                            style: TextStyle(
                                color: customColors.textTitleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        customColors.backgroundButtonColor,
                                    minimumSize: const Size(120, 20)),
                                child: const Text(
                                  'WATCH NOW',
                                  style: TextStyle(
                                      color: Color(0xffd6d6d4),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: StarRating(
                                    percentage: state.movie.voteAverage),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Text(
                            state.movie.overview,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color(0xff869199),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.7,
                                letterSpacing: 0),
                          ),
                          const CreditsPoster(),
                          RowDetailsList(
                              title: 'Studio',
                              items: state.movie.productionCompanies
                                  .map((productionCompanie) =>
                                      productionCompanie.name)
                                  .toList()),
                          RowDetailsList(
                              title: 'Genre',
                              items: state.movie.genres
                                  .map((genre) => genre.name)
                                  .toList()),
                          RowDetailsList(
                              title: 'Release',
                              items: [state.movie.releaseDate.split('-')[0]]),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              );
            case GetMovieDetailsFailure():
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
