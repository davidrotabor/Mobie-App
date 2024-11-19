import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/features/movies/presentation/bloc/search_movies/search_movies_bloc.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        if (text != '') {
          BlocProvider.of<SearchMoviesBloc>(context)
              .add(OnSearchMovies(text: text));
        } else {
          BlocProvider.of<SearchMoviesBloc>(context)
              .add(OnDeleteSearchMovies());
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white24.withOpacity(0.15),
        hintText: "Search",
        hintStyle: const TextStyle(color: Color(0xffa5c1d3)),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xffd3d9dc),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        fontSize: 15,
        height: 3.4,
        letterSpacing: -0.3,
        color: Color(0xffd3d9dc),
      ),
    );
  }
}
