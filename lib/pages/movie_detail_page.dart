import 'package:flutter/material.dart';
import 'package:overview_movies/data/viewmodels/movie_view_model.dart';

class MovieDetail extends StatelessWidget {
  final MovieViewModel movies;

  MovieDetail({this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.movies.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: FadeInImage(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      placeholder: AssetImage('assets/images/not_found.png'),
                      image: NetworkImage(this.movies.backdropPatch),
                      fit: BoxFit.cover),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.all_inclusive),
                            tooltip: 'Popularity'),
                        Text(this.movies.popularity),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.star_rate),
                            tooltip: 'Vote Average'),
                        Text(this.movies.voteAverage),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.rate_review),
                            tooltip: 'Vote Count'),
                        Text(this.movies.voteCount),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.new_releases),
                            tooltip: 'Release Date'),
                        Text(this.movies.releaseDate),
                      ],
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Overview",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                Text(this.movies.overview.length == 0
                    ? "Nothing Overview"
                    : this.movies.overview),
              ],
            ),
          ),
        ));
  }
}
