import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc_pattern/models/movie.dart';
import '../models/category.dart';

class CategoryDetailCubit extends Cubit<List<Movie>>{
  CategoryDetailCubit():super(<Movie>[]);

  var refMovies= FirebaseDatabase.instance.ref().child("filmler");

  Future<void> getAllMovies(Category category) async{

    var movieList=<Movie>[];

    refMovies.onValue.listen((event){
      var responseData= event.snapshot.value as dynamic;

      if(responseData!=null){
        responseData.forEach((key,value){
          var movie=Movie.fromJson(key, value);
          if(movie.category_name==category.category_name)
            {
              movieList.add(movie);
            }
        });
        emit(movieList);
      }
    });
  }
}