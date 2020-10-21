import 'package:flutter/material.dart';
import 'package:overview_movies/pages/movie_list_page.dart';
import 'package:provider/provider.dart';
import 'data/viewmodels/movie_list_view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies",
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(),
        child: MovieListPage(),
      ),
    );
  }
}
