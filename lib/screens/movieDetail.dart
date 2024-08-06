import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetail extends StatelessWidget{

  Movie movie;
  MovieDetail({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.movie_name),
        backgroundColor: Colors.yellowAccent,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("lib/images/${movie.movie_image_name}"),
            Text(movie.movie_year.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),),
            Text(movie.director_name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),),
          ],
        ),
      ),
    );
  }

}