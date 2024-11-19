import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/config/constants/environment.dart';
import 'package:prueba_tecnica/config/constants/themes/data/CustomColors.dart';
import 'package:prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_credits/get_movie_credits_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/get_details/get_movie_details_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:prueba_tecnica/features/movies/presentation/widgets/star_rating.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;

  const MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return SizedBox(
      width: 135,
      child: InkWell(
        onTap: () {
          BlocProvider.of<GetMovieDetailsBloc>(context).add(OnDeleteDetails());
          BlocProvider.of<GetMovieDetailsBloc>(context)
              .add(OnGetMovieDetails(id: movie.id));
          BlocProvider.of<GetMovieCreditsBloc>(context).add(OnDeleteCredits());
          BlocProvider.of<GetMovieCreditsBloc>(context)
              .add(OnGetMovieCredits(id: movie.id));

          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return MovieDetails(movieId: movie.id);
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(
                '${Environment.apiImagesUrl}/w200${movie.posterPath}',
                height: 200,
              ),
            ),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: customColors!.textTitleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            StarRating(percentage: movie.voteAverage)
          ],
        ),
      ),
    );
  }
}
