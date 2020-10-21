import 'package:overview_movies/data/models/movie.dart';

class MovieViewModel {
  final Movie movie;
  final String imageUrl = "http://image.tmdb.org/t/p/w500";

  MovieViewModel({this.movie});

  String get popularity {
    return this.movie.popularity.toString();
  }

  String get backdropPatch {
    return "${this.imageUrl}${this.movie.backdropPath}";
  }

  String get overview {
    return this.movie.overview;
  }

  String get posterPath {
    return "${this.imageUrl}${this.movie.posterPath}";
  }

  String get releaseDate {
    return this.movie.releaseDate;
  }

  String get title {
    return this.movie.title;
  }

  String get voteAverage {
    return this.movie.voteAverage.toString();
  }

  String get voteCount {
    return this.movie.voteCount.toString();
  }
}
