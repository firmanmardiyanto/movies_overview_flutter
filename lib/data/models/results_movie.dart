import 'package:overview_movies/data/models/movie.dart';

class ResultsMovie {
  final int page;
  final int totalResults;
  final int totalPages;
  final Iterable movies;

  ResultsMovie({this.page, this.totalResults, this.totalPages, this.movies});

  List<Movie> get movie {
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }
}
