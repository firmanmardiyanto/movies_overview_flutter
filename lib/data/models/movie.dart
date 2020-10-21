class Movie {
  final num popularity;
  final num voteCount;
  final num voteAverage;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;

  Movie(
      {this.popularity,
      this.backdropPath,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.voteAverage,
      this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> movies) {
    return Movie(
        title: movies["title"],
        popularity: movies["popularity"],
        backdropPath: movies["backdrop_path"],
        overview: movies["overview"],
        posterPath: movies["poster_path"],
        releaseDate: movies["release_date"],
        voteAverage: movies["vote_average"],
        voteCount: movies["vote_count"]);
  }
}
