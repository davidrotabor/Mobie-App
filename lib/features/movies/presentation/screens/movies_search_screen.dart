import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/config/constants/themes/presentation/theme_bloc.dart';
import 'package:prueba_tecnica/config/constants/themes/presentation/theme_event.dart';
import 'package:prueba_tecnica/features/movies/presentation/widgets/movies_modal.dart';
import 'package:prueba_tecnica/features/movies/presentation/widgets/search.dart';

class MoviesSearchScreen extends StatelessWidget {
  const MoviesSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4f87b2),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    bool isDark =
                        context.read<ThemeBloc>().state == ThemeMode.dark;
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeChanged(!isDark));
                  },
                  icon: BlocBuilder<ThemeBloc, ThemeMode>(
                      builder: (context, state) {
                    switch (state) {
                      case ThemeMode.dark:
                        return Icon(
                          context.read<ThemeBloc>().state == ThemeMode.dark
                              ? CupertinoIcons.moon
                              : CupertinoIcons.sun_min,
                          color: Colors.white60,
                        );
                      case ThemeMode.light:
                        return Icon(
                          context.read<ThemeBloc>().state == ThemeMode.dark
                              ? CupertinoIcons.moon
                              : CupertinoIcons.sun_min,
                          color: Colors.white60,
                        );
                      default:
                        return Container();
                    }
                  }),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello, what do you\nwant to watch ?",
                        style: TextStyle(
                            color: Color(0xffd6d6d4),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.8),
                      ),
                      Container(
                        height: 34,
                        margin: const EdgeInsets.only(top: 15),
                        child: const Search(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const MoviesModal()
        ],
      ),
    );
  }
}
