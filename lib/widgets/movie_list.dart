import 'package:flutter/material.dart';
import 'package:overview_movies/data/viewmodels/movie_view_model.dart';
import 'package:overview_movies/pages/movie_detail_page.dart';

class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;

  MovieList({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (context, index) {
        final movie = this.movies[index];

        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MovieDetail(movies: movie);
            }));
          },
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            child: FadeInImage(
                placeholder: AssetImage('assets/images/not_found.png'),
                image: NetworkImage(movie.posterPath),
                fit: BoxFit.cover),
            width: 50,
            height: 125,
          ),
          title: Text(movie.title),
          subtitle: Text("Release date : ${movie.releaseDate}"),
        );
      },
    );
  }
}
