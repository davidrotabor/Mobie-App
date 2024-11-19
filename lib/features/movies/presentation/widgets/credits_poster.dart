import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/config/constants/environment.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_credits/get_movie_credits_bloc.dart';

class CreditsPoster extends StatelessWidget {
  const CreditsPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMovieCreditsBloc, GetMovieCreditsState>(
      builder: (context, state) {
        switch (state) {
          case GetMovieCreditsLoading():
            return const Center(child: Text("No hay créditos disponibles."));
          case GetMovieCreditsSuccess():
            return Container(
              margin: const EdgeInsets.only(top: 20),
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movieCredits.length,
                itemBuilder: (context, index) {
                  final credit = state.movieCredits[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: credit.profilePath.isNotEmpty
                              ? NetworkImage(
                                  '${Environment.apiImagesUrl}/w200${credit.profilePath}')
                              : null,
                          child: credit.profilePath.isEmpty
                              ? const Icon(Icons.person,
                                  size:
                                      40.0)
                              : null,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          maxLines: 2,
                          credit.originalName,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff869199),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          case GetMovieCreditsFailure():
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red),
                  const Text("Hubo un error al cargar los créditos."),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text("Reintentar"),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
