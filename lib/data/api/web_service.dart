import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:overview_movies/data/models/results_movie.dart';

class WebService {
  Future<ResultsMovie> fetchMovies(String keyword, int page) async {
    final url =
        "https://api.themoviedb.org/3/search/movie?api_key=5c55ea53ea67934a7783c6ced7b8f7b9&query=$keyword&page=$page";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return ResultsMovie(
          page: body["page"],
          totalResults: body["total_results"],
          totalPages: body["total_pages"],
          movies: body["results"]);
    }
    throw Exception(
        "Gagal fecthing aduhh, sad sekali disini bisa kirim fallback error tapi gatau cara nampilin di ui nya, ehehe");
  }
}
