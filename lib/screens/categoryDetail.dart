import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc_pattern/cubit/categoryDetailCubit.dart';
import 'package:movie_app_bloc_pattern/screens/movieDetail.dart';
import '../models/category.dart';
import '../models/movie.dart';

class CategoryDetail extends StatefulWidget{

  Category category;
  CategoryDetail({required this.category});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail>{

  @override
  void initState() {
    super.initState();
    context.read<CategoryDetailCubit>().getAllMovies(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text("Filmler: ${widget.category.category_name}"),
        backgroundColor: Colors.yellowAccent,
      ),
      body: BlocBuilder<CategoryDetailCubit, List<Movie>>(
        builder: (context, movieList){
          if(movieList.isNotEmpty)
          {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3/5,
                ),
                itemCount: movieList.length,
                itemBuilder: (context, index)
                {
                  var movie=movieList[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetail(movie: movie)));
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("lib/images/${movie.movie_image_name}"),
                          Text(movie.movie_name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ),
                  );
                }
            );
          }
          else
          {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}