import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:overview_movies/data/viewmodels/movie_list_view_model.dart';
import 'package:overview_movies/widgets/movie_list.dart';

import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  String keyword = "Avenger";
  MovieListViewModel vmMovie;
  SearchBar searchBar;

  void _getMovies(BuildContext context, String keyword, int page) {
    this.vmMovie.fetchMovies(keyword, page);
    setState(() {
      this.keyword = keyword;
    });
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text(
          "F-Movies(${this.vmMovie.resultInfo.totalResult} * ${this.keyword})"),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  _MovieListPageState() {
    searchBar = new SearchBar(
        setState: setState,
        onSubmitted: (value) => {_getMovies(context, value, 1)},
        buildDefaultAppBar: buildAppBar);
  }

  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false)
        .fetchMovies(this.keyword, 1);
  }

  @override
  Widget build(BuildContext context) {
    this.vmMovie = Provider.of<MovieListViewModel>(context);

    return Scaffold(
        appBar: searchBar.build(context),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Expanded(child: MovieList(movies: this.vmMovie.movies)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          if (this.vmMovie.resultInfo.page > 1) {
                            this.vmMovie.fetchMovies(
                                this.keyword, this.vmMovie.resultInfo.page - 1);
                          } else {
                            this.vmMovie.fetchMovies(this.keyword,
                                this.vmMovie.resultInfo.totalPage);
                          }
                        }),
                  ),
                  Expanded(
                    child: Text(
                      "${vmMovie.resultInfo.page} of ${vmMovie.resultInfo.totalPage}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                      child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (this.vmMovie.resultInfo.page <
                          this.vmMovie.resultInfo.totalPage) {
                        this.vmMovie.fetchMovies(
                            this.keyword, this.vmMovie.resultInfo.page + 1);
                      } else {
                        this.vmMovie.fetchMovies(this.keyword, 1);
                      }
                    },
                  ))
                ],
              ),
            ])));
  }
}
