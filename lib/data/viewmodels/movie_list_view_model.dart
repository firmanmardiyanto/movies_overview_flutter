import 'package:flutter/material.dart';
import 'package:overview_movies/data/api/web_service.dart';
import 'package:overview_movies/data/viewmodels/movie_view_model.dart';
import 'package:overview_movies/data/viewmodels/result_info_view_model.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = List<MovieViewModel>();
  ResultInfoModel resultInfo = ResultInfoModel();

  Future<void> fetchMovies(String keyword, int page) async {
    await WebService().fetchMovies(keyword, page).then((resultsmovie) => {
          this.resultInfo = ResultInfoModel(
              page: resultsmovie.page,
              totalResult: resultsmovie.totalResults,
              totalPage: resultsmovie.totalPages),
          this.movies = resultsmovie.movie
              .map((movie) => MovieViewModel(movie: movie))
              .toList(),
        });
    notifyListeners();
  }
}
